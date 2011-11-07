# Load in redis to go if we can
if (redis_to_go = ENV["REDISTOGO_URL"])
  uri = URI.parse(redis_to_go)

  Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
end
