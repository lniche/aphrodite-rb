class JwtService
  SECRET_KEY = Rails.application.credentials.secret_key_base # 从Rails secrets读取密钥

  # 生成 JWT
  def self.encode(payload)
    JWT.encode(payload, SECRET_KEY)
  end

  # 解码 JWT
  def self.decode(token)
    body = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new(body)
  rescue JWT::DecodeError
    nil
  end
end
