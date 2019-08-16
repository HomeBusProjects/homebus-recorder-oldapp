# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
start = Time.now - 500

uuids = []

10.times.each do
  uuids.push SecureRandom.uuid
end

500.times.each do
  uuid = uuids.sample

  topic = "/homebus/device/#{uuid}"

  case rand(8)
  when 1
    topic += '/cmd'
  when 2
    topic += '/log'
  when 3
    topic += '/$error'
  end

  Sample.create(created_at: start, topic: topic, data: { id: uuid, foo: { x: rand(100), y: rand(512) }, bar: rand(1024) })
end
