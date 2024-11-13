class RequestIdMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new(env)
    request_id = request.get_header('X-Request-ID')
    request_id = SecureRandom.uuid if request_id.nil? || request_id.empty?
    Thread.current[:request_id] = request_id
    status, headers, response = @app.call(env)
    headers['X-Request-ID'] = request_id
    [status, headers, response]
  end
end
