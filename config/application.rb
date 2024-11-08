require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module AphroditeRb
  class Application < Rails::Application
    config.load_defaults 7.2
    config.autoload_lib(ignore: %w[assets tasks])
    # config.time_zone = "UTC"
    config.middleware.use RequestIdMiddleware

    Rails.logger = Logger.new(STDOUT)
    Rails.logger.formatter = proc do |severity, timestamp, progname, msg|
      trace_id = Thread.current[:request_id] || 'unknown'
      "[#{timestamp.strftime('%Y-%m-%d %H:%M:%S')}] #{severity} [trace_id: #{trace_id}] #{msg}\n"
    end

  end
end
