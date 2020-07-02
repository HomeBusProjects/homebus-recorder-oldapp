require 'mqtt'
require 'uri'
require 'json'

require 'pp'

class PowerJob < ApplicationJob
  queue_as :default

  def perform(*args)
    uri = URI.parse ENV['CLOUDMQTT_URL'] || 'mqtt://localhost:1883'
    pp uri

    conn_opts = {
      remote_host: uri.host,
      remote_port: uri.port,
      username: uri.user,
      password: uri.password,
    }

    loop do
      # THIS IS ABSOLUTELY THE WRONG WAY TO DO THIS
      # ACCORDING TO THE SPEC WE SHOULD SET UP A BROKER
      # ONLY DOING IT THIS WAY FOR TESTING AND EXPEDIENCE
      MQTT::Client.connect(conn_opts) do |c|
        c.get('#') do |topic, message|
          # we really don't need to record the ticks...
          next if topic == '/tick'
          
          puts "#{topic}: #{message}"

          begin
            json = JSON.parse message.encode('UTF-8', :invalid => :replace, :undef => :replace, replace: '?'), symbolize_names: true
          rescue
            puts "JSON failure: #{message}"

            begin
              c.publish('homebus/recorder/$error', JSON.generate({ topic: topic, message: "invalid JSON: #{message.encode('UTF-8', :invalid => :replace, :undef => :replace, replace: '?')}" }))
            rescue
              c.publish('homebus/recorder/$error', JSON.generate({ topic: topic, message: "invalid JSON: #{message.bytes}" }))
            end
          else
            if json.class == Hash && (json[:id] || json[:source])
             if json[:contents]
		contents = json[:contents][:payload]

                json[:contents].except! :payload

                Ddc.where(name: json[:contents][:ddc]).first_or_create!

                Sample.create data: contents,
                              headers: json,
                              topic: topic,
                              timestamp: json[:timestamp],
                              sequence: json[:sequence],
                              ddc: json[:contents][:ddc],
                              uuid: json[:source] || json[:id]
              else
                Sample.create data: json,
                              topic: topic,
                              timestamp: json[:timestamp],
                              uuid: json[:id] || json[:source]
              end
            else
              Sample.create data: json,
                            topic: topic
            end
          end
        end
      end
    end

  end
end
