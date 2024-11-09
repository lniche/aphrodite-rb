Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # origins 'http://127.0.0.1:8000'
    resource '*', headers: :any, methods: %i[get post put delete options]
  end
end
