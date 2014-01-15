require 'redis'
require 'json'
require 'faye'

bayeaux = Faye::RackAdapter.new(mount: "/faye", timeout: 25)
Faye::WebSocket.load_adapter('thin')

run bayeaux

Thread.new do
  client = Faye::Client.new('http://localhost:9292/faye')
  redis = Redis.new

  redis.subscribe('wdiarray') do |on|
    on.message do |channel, redis_string, total_channels|
      p data = JSON.parse(redis_string)

      client.publish("/group/#{data['group_id']}", data)
    end
  end
end
