redis_url = ENV['REDIS_URL'] || 'redis://127.0.0.1:6379/0'

Rails.application.config.redis = Redis.new(url: redis_url, timeout: 5)
