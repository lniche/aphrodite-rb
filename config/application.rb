require_relative 'boot'
require 'rails/all'
require_relative '../app/middleware/request_id_middleware'

Bundler.require(*Rails.groups)

module AphroditeRb
  class Application < Rails::Application
    config.load_defaults 7.2
    config.autoload_paths += %W(#{config.root}/lib)
    config.time_zone = "UTC"
    config.middleware.use RequestIdMiddleware

    Rails.logger = Logger.new(STDOUT)
    Rails.logger.formatter = proc do |severity, timestamp, progname, msg|
      trace_id = Thread.current[:request_id] || ''
      "[#{timestamp.strftime('%Y-%m-%d %H:%M:%S')}] #{severity} [#{trace_id}] #{msg}\n"
    end
  end
end
