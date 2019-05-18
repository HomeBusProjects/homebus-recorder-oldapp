set :output, "~/recorder/shared/log/whenever.log"

every 1.hour do
  command "cd ~/recorder/current/backup ; bundle exec backup -t hourly_backup.rb"
end
