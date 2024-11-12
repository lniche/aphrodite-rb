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
  SUCCESS = { code: 0, message: 'Request Successful' }.freeze
  UNAUTHORIZED = { code: 401, message: 'Unauthorized' }.freeze
  FORBIDDEN = { code: 403, message: 'Forbidden' }.freeze
  NOT_FOUND = { code: 404, message: 'Resource Not Found' }.freeze
  INTERNAL_SERVER_ERROR = { code: 500, message: 'Internal Server Error' }.freeze
  BAD_REQUEST = { code: 400, message: 'Bad Request' }.freeze
  VALIDATION_ERROR = { code: 422, message: 'Validation Failed' }.freeze
  METHOD_NOT_ALLOWED = { code: 405, message: 'Method Not Allowed' }.freeze

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
