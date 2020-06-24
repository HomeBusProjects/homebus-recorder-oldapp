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
            json = JSON.parse message, symbolize_names: true
          rescue
            puts "JSON failure: #{message}"
            c.publish('/recorder/$error', JSON.generate({ topic: topic, message: "invalid JSON: #{message}" }))
          else
            if json.class == Hash && (json[:id] || json[:src])
              m = topic.match /homebus\/device\/[\d|a-z|A-Z-]+\/([\w|\-|\.]+)/
              if m
                ddc = m[1]
              end

              Sample.create data: json,
                            topic: topic,
                            seq: json[:sequence],
                            ddc: ddc,
                            src: json[:src] || json[:id]
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
