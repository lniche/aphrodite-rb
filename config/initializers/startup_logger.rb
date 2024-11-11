unless Rails.env.production?
  host = Rails.configuration.x.app.host || '127.0.0.1'
  port = Rails.configuration.x.app.port || 8000

  Rails.logger.info '==============================='
  Rails.logger.info "Listening on #{format('http://%s:%d', host, port)}"
  Rails.logger.info "Docs addr: #{format('http://%s:%d/swagger-ui/index.html', host, port)}"
  Rails.logger.info '==============================='
end
