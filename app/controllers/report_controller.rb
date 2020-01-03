class ReportController < ApplicationController
  def index
    @access = Device.access
    @cameras = Device.camera
    @discoballs = Device.discoball
    @furballs = Device.furball
    @printers_3d = Device.printers_3d

    @network_active_hosts_max = Sample.where('created_at > ?', Time.now - 1.day).maximum("((data->'active_hosts'->>'arp_table_length')::integer)")

    Sample.where(uuid: '638a9d78-09f6-4d92-b70a-2b14edb8d84a').where('created_at > ?', Time.now - 1.day).maximum("((data->'environment'->>'temperature')::real)")
    Sample.where(uuid: '638a9d78-09f6-4d92-b70a-2b14edb8d84a').where('created_at > ?', Time.now - 1.day).minimum("((data->'environment'->>'temperature')::real)")
  end
end
