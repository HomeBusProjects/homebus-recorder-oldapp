set :output, "~/recorder/shared/log/whenever.log"

every 1.hour do
  command "cd ~/recorder/current/backup ; backup perform -t hourly_backup"
end
