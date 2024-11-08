module V1
  class AuthController < ApplicationController
    before_action :authenticate_user!, only: [:logout]

    def send_sms
      send_verify_code_req = Requests::SendVerifyCodeReq.new(send_verify_code_params)

      code = rand(1000..9999).to_s 
      logger.info("Sending SMS code: phone=#{send_verify_code_req.phone}, code=#{code}")
      
      Rails.cache.write("sms_code_#{send_verify_code_req.phone}", code, expires_in: 5.minutes)
      # TODO fake send
      render json: ApiResponse.ok()
    end
      
    def send_verify_code_params
      params.require(:auth).permit(:phone)
    end

    def login
      login_req = Requests::LoginReq.new(login_params)

      cached_code = Rails.cache.read("sms_code_#{login_req.phone}")
      return render json: { error: '验证码无效或已过期' }, status: :unauthorized if cached_code.nil? || cached_code != code

      payload = { phone: login_req.phone, exp: 24.hours.from_now.to_i }
      token = JwtService.encode(payload)

      render json: { token: token }, status: :ok
    end

    def logout
      render json: ApiResponse.ok()
    end

    def login_params
      params.require(:auth).permit(:phone, :code)
    end

  end
end
