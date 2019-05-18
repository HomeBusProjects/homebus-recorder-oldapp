set :output, 'log/whenever.log'

every 1.hour do
  system "cd backup ; bundle exec backup -t hourly_backup.rb"
end
