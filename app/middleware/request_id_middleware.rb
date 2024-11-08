# app/middleware/request_id_middleware.rb

class RequestIdMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    # 获取请求头中的 X-Request-ID
    request = Rack::Request.new(env)
    request_id = request.get_header("X-Request-ID")

    # 如果没有请求头 X-Request-ID，则生成一个新的 UUID
    if request_id.nil? || request_id.empty?
      request_id = SecureRandom.uuid
    end

    # 将请求的 X-Request-ID 存储到当前线程，方便在日志中访问
    Thread.current[:request_id] = request_id

    # 通过中间件处理响应
    status, headers, response = @app.call(env)

    # 在响应头中加入 X-Request-ID
    headers["X-Request-ID"] = request_id

    # 返回修改后的响应
    [status, headers, response]
  end
end
