require 'mqtt'
require 'uri'
require 'json'

require 'pp'

class PowerJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts '>>>> PowerJob'

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

          json = JSON.parse message
          if json["uuid"]
            Sample.create data: message,
                          topic: topic,
                          uuid: json["uuid"]
          else
            Sample.create data: message,
                          topic: topic
          end
        end
      end
    end

  end
end
