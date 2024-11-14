redis_url = ENV['REDIS_URL'] || 'redis://127.0.0.1:6379/0'

$redis = ConnectionPool.new(size: 5, timeout: 5) do
  Redis.new(url: redis_url)
end

$redis.with do |redis|
  next_uno_value = redis.get('next:uno')

  if next_uno_value.nil?
    redis.set('next:uno', 100000)
  end
end