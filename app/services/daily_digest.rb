class DailySamplesModel
  def self.make_digest
  end

  private
  def self.make_furball_digest
    @furballs.each do |furball|
      furball[:max_temp] = Sample.where(uuid: furball[:uuid]).where('created_at > ?', @start_time).maximum("((data->'environment'->>'temperature')::real)")
      furball[:min_temp] = Sample.where(uuid: furball[:uuid]).where('created_at > ?', @start_time).minimum("((data->'environment'->>'temperature')::real)")
      furball[:samples] = Sample.where(uuid: furball[:uuid]).where('created_at > ?', @start_time).count
    end
  end

  def self.make_network_digest
    network_active_hosts_max = Sample.where('created_at > ?', @start_time).maximum("((data->'active_hosts'->>'arp_table_length')::integer)")
    
  end

  def self.make_access_digest
    @doors.each do |door|
      door[:opened] = Sample.where(uuid: door[:uuid]).where('created_at > ?', @start_time).where("data->>'action' = 'opened'").count
      door[:unlocked] = Sample.where(uuid: door[:uuid]).where('created_at > ?', @start_time).where("data->>'action' = 'unlocked'").count
      door[:locked] = Sample.where(uuid: door[:uuid]).where('created_at > ?', @start_time).where("data->>'action' = 'locked'").count
      door[:denied] = Sample.where(uuid: door[:uuid]).where('created_at > ?', @start_time).where("data->>'action' = 'access denied'").count
    end
  end

end
