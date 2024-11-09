module V1
  class AuthController < ApplicationController
    before_action :authenticate_user!, only: [:logout]

    def send_sms
      send_verify_code_req = Requests::SendVerifyCodeReq.new(params[:auth])
      if send_verify_code_req.valid?
        code = rand(1000..9999).to_s 
        logger.info("Sending SMS code: phone=#{send_verify_code_req.phone}, code=#{code}")
        Rails.cache.write("sms_code_#{send_verify_code_req.phone}", code, expires_in: 5.minutes)
        # TODO fake send
        render json: ApiResponse.ok(), status: :ok
      else
        render json: ApiResponse.err(), status: :bad_request
      end
    end
      
    def login
      login_req = Requests::LoginReq.new(params[:auth])
      if login_req.valid?
        cached_code = Rails.cache.read("sms:code:#{login_req.phone}")
        return render json: ApiResponse.err(), status: :unauthorized if cached_code.nil? || cached_code != code
        payload = { phone: login_req.phone, exp: 24.hours.from_now.to_i }
        token = JwtService.encode(payload)
        render json: { token: token }, status: :ok
      else
        render json: ApiResponse.err(), status: :bad_request
      end
    end

    def logout
      current_user.touch(:updated_at)
      current_user.update(login_token: nil)
      render json: ApiResponse.ok()
    end

  end
end
