class ReportController < ApplicationController
  def index
    @doors = [
      {
        uuid: '3cebd358-63bf-42b3-a694-8bd016b86968',
        name: 'unit 2 front door'
      }, {
        uuid: '4cec18dd-0ecc-4d27-bb91-cabd053ae088',
        name: 'front craft lab'
      }, {
        uuid: '2b2b257a-b846-41f2-b29b-fedb096f59b1',
        name: 'unit 3 back door'
      }
    ]

    @furballs = [
      {
        uuid: '638a9d78-09f6-4d92-b70a-2b14edb8d84a',
        name: 'Laser Lab'
      },
      {
        uuid: '04001f9a-122b-4045-84f4-69b7c7318250',
        name: 'Unit 2'
      },
      {
        uuid: '1955b27e-17fd-429a-b1ce-293879149e42',
        name: 'Unit 2 (weather station)'
      },
      {
        uuid: '067746e8-7a2f-4f6e-bb59-e1b2043b37f3',
        name: 'Slytherin'
      },
      {
        uuid: 'b3efa04b-dac8-4ddc-bc34-94f1daec3c0a',
        name: 'Craft Lab'
      }, {
        uuid: '1955b27e-17fd-429a-b1ce-293879149e42',
        name: 'Unit 2 (ws)'
      }, {
        uuid: 'ae1dd9a7-b55c-4255-8f16-7e5c69fd678b',
        name: 'Electronics Lab'
      }
    ]

    @printers = [
      {
        uuid: '7bfff065-f2e8-406d-b8d1-734a84c4c222',
        name: 'Dremel'
      }, {
        uuid: '37853276-5ac4-406c-bb66-e012cd360781',
        name: 'Zoya'
      }, {
        uuid: 'ca01bc7f-21ed-4e86-bcc8-efcdb3dcd696',
        name: 'Olga',
      }, {
        uuid: '6ab73b55-006b-4a95-adaa-1b9e34c85d46',
        name: 'Prusa 1'
      }
    ]; 

    @weather_stations = [
      {
        uuid: '691faad6-bad4-4c87-838b-091ce650e4d4',
        name: 'OpenWeatherMap'
      }, {
        uuid: 'ea52198c-6162-4ea8-9e19-2f99bcfb4462',
        name: 'CTRLH'
      }
    ]

    @servers = [
      '8cb9e03e-1bfe-4ad7-b96e-e9186956b746',
      '59905e56-b683-4b22-bc66-345705a3f27e',
      '9fb914b1-1c5a-40b0-8c6d-eac29bb1ea3d',
      '0d1fd497-8cf7-47b2-b0fc-baab52c52301',
      '7f9ee46e-355e-4b7c-a2c1-fe24e733796a',
      '0b75a4f6-0467-4986-9b05-fedeba1bbbf8'
    ]; 


    @network_active_hosts_max = Sample.where('created_at > ?', Time.now - 1.day).maximum("((data->'active_hosts'->>'arp_table_length')::integer)")

    @furballs.each do |furball|
      furball[:max_temp] = Sample.where(uuid: furball[:uuid]).where('created_at > ?', Time.now - 1.day).maximum("((data->'environment'->>'temperature')::real)")
      furball[:min_temp] = Sample.where(uuid: furball[:uuid]).where('created_at > ?', Time.now - 1.day).minimum("((data->'environment'->>'temperature')::real)")
      furball[:samples] = Sample.where(uuid: furball[:uuid]).where('created_at > ?', Time.now - 1.day).count
    end

    @weather_stations.each do |station|
      station[:max_temp] = Sample.where(uuid: station[:uuid]).where('created_at > ?', Time.now - 1.day).maximum("((data->'weather'->>'temperature')::real)")
      station[:min_temp] = Sample.where(uuid: station[:uuid]).where('created_at > ?', Time.now - 1.day).minimum("((data->'weather'->>'temperature')::real)")
      station[:max_humidity] = Sample.where(uuid: station[:uuid]).where('created_at > ?', Time.now - 1.day).maximum("((data->'weather'->>'humidity')::real)")
      station[:min_humidity] = Sample.where(uuid: station[:uuid]).where('created_at > ?', Time.now - 1.day).minimum("((data->'weather'->>'humidity')::real)")
      station[:samples] = Sample.where(uuid: station[:uuid]).where('created_at > ?', Time.now - 1.day).count
    end

    @doors.each do |door|
      door[:opened] = Sample.where(uuid: door[:uuid]).where('created_at > ?', Time.now - 1.day).where("data->>'action' = 'opened'").count
      door[:unlocked] = Sample.where(uuid: door[:uuid]).where('created_at > ?', Time.now - 1.day).where("data->>'action' = 'unlocked'").count
      door[:locked] = Sample.where(uuid: door[:uuid]).where('created_at > ?', Time.now - 1.day).where("data->>'action' = 'locked'").count
      door[:denied] = Sample.where(uuid: door[:uuid]).where('created_at > ?', Time.now - 1.day).where("data->>'action' = 'access denied'").count
    end

    @minutes_in_interval = 1.day.to_i/60
  end
end
