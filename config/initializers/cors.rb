Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # origins 'http://localhost:8000'
    resource '*', headers: :any, methods: [:get, :post, :put, :delete, :options]
  end
end