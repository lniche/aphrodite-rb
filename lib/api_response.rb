module ApiResponse
  def self.ok(data = nil, message = nil)
    code ||= 'ok'
    { code: 0, message: message, data: data }
  end

  def self.err(code = nil, message = nil, data = nil)
    code ||= -1
    code ||= 'err'
    { code: code, message: message, data: data }
  end
end

module ResponseStatus
  # 使用 freeze 防止修改
  SUCCESS = { code: 0, message: '请求成功' }.freeze
  UNAUTHORIZED = { code: 401, message: '未授权' }.freeze
  FORBIDDEN = { code: 403, message: '禁止访问' }.freeze
  NOT_FOUND = { code: 404, message: '未找到资源' }.freeze
  INTERNAL_SERVER_ERROR = { code: 500, message: '服务器内部错误' }.freeze
  BAD_REQUEST = { code: 400, message: '请求无效' }.freeze
  VALIDATION_ERROR = { code: 422, message: '验证失败' }.freeze
  METHOD_NOT_ALLOWED = { code: 405, message: '方法不允许' }.freeze

  # 用方法返回错误，避免手动重复写状态码和消息
  def self.success
    SUCCESS
  end

  def self.unauthorized
    UNAUTHORIZED
  end

  def self.forbidden
    FORBIDDEN
  end

  def self.not_found
    NOT_FOUND
  end

  def self.internal_server_error
    INTERNAL_SERVER_ERROR
  end

  def self.bad_request
    BAD_REQUEST
  end

  def self.validation_error
    VALIDATION_ERROR
  end

  def self.method_not_allowed
    METHOD_NOT_ALLOWED
  end
end
