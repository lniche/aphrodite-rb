module V1
  class AuthController < ApplicationController
    # 发送短信验证码
    swagger_controller :auth, '认证'

    # POST /api/v1/auth/send_sms
    swagger_api :send_sms do
      summary '发送短信验证码'
      param :body, :phone, :string, :required, '手机号码'
    end
    def send_sms
      phone = params[:phone]

      # 这里假设你使用 Twilio 发送短信验证码
      code = rand(1000..9999).to_s # 生成一个 4 位的验证码

      # 保存验证码用于登录验证 (可以存储在数据库或缓存中)
      # 这里为了简单使用 Redis 来存储验证码
      Rails.cache.write("sms_code_#{phone}", code, expires_in: 5.minutes)

      render json: { message: '验证码已发送' }, status: :ok
    end

    # 用户登录
    swagger_api :login do
      summary '通过验证码登录'
      param :body, :phone, :string, :required, '手机号码'
      param :body, :code, :string, :required, '验证码'
    end
    def login
      phone = params[:phone]
      code = params[:code]

      # 验证验证码
      cached_code = Rails.cache.read("sms_code_#{phone}")
      return render json: { error: '验证码无效或已过期' }, status: :unauthorized if cached_code.nil? || cached_code != code

      # 创建 JWT token
      payload = { phone: phone, exp: 24.hours.from_now.to_i }
      token = JwtService.encode(payload)

      # 返回登录成功的 token
      render json: { token: token }, status: :ok
    end

    # 用户登出
    swagger_api :logout do
      summary '用户登出'
      notes '登出只是让客户端删除本地存储的 token'
    end
    def logout
      # 在服务器端不需要做任何操作，只需要客户端删除 token 即可
      render json: { message: '已成功登出' }, status: :ok
    end
  end
end
