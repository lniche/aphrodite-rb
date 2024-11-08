module V1
  class AuthController < ApplicationController
    before_action :authenticate_user!, only: [:logout]

    def send_sms
      phone = params[:phone]

      code = rand(1000..9999).to_s 

      Rails.cache.write("sms_code_#{phone}", code, expires_in: 5.minutes)

      render json: ApiResponse.ok()
    end

    def login
      phone = params[:phone]
      code = params[:code]

      cached_code = Rails.cache.read("sms_code_#{phone}")
      return render json: { error: '验证码无效或已过期' }, status: :unauthorized if cached_code.nil? || cached_code != code

      payload = { phone: phone, exp: 24.hours.from_now.to_i }
      token = JwtService.encode(payload)

      render json: { token: token }, status: :ok
    end

    def logout
      render json: ApiResponse.ok()
    end
  end
end
