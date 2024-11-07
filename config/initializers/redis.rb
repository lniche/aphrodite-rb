redis_url = ENV['REDIS_URL'] || 'redis://localhost:6379/0'

Rails.application.config.redis = Redis.new(url: redis_url, timeout: 5)
