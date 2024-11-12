require 'snowflake'

module V1
  class AuthController < ApplicationController
    before_action :authenticate_user!, only: [:logout]

    def send_sms
      send_verify_code_req = Requests::SendVerifyCodeRequest.new(params[:auth])
      if send_verify_code_req.valid?
        code = rand(1000..9999).to_s
        logger.info("Sending SMS code: phone=#{send_verify_code_req.phone}, code=#{code}")
        Rails.cache.write("#{CacheKeys::SMS_CODE}#{send_verify_code_req.phone}", code, expires_in: 1.minutes)
        # TODO: fake send
        render json: ApiResponse.ok, status: :ok
      else
        render json: ApiResponse.err, status: :bad_request
      end
    end

    def login
      login_request = Requests::LoginRequset.new(params[:auth])
      if login_request.valid?
        if login_request.code != '9999' || !(Rails.env.development? || Rails.env.test?)
          cached_code = Rails.cache.read("#{CacheKeys::SMS_CODE}#{login_request.phone}")
          if cached_code.nil? || cached_code != login_request.code
            return render json: ApiResponse.err,
                          status: :unauthorized
          end
        end
        user = User.find_by(phone: login_request.phone)
        if user
          payload = { user_code: user.user_code, exp: 24.hours.from_now.to_i }
          token = JwtService.encode(payload)
          user.update(login_at: Time.current, login_token: token)
          login_response = LoginResponse.new(access_token:token)
          render json: ApiResponse.ok(login_response), status: :ok
        else
          nickname = "SUGAR_#{login_request.phone[-4..-1]}"
          redis = Rails.application.config.redis
          user_no = redis.get(CacheKeys::NEXT_UNO) || 100_000
          redis.set(CacheKeys::NEXT_UNO, user_no) if user_no == 100_000
          user_no = redis.incr(CacheKeys::NEXT_UNO)
          snowflake = Snowflake.new(1, 1)
          user_code = snowflake.generate_id
          payload = { user_code: user_code, exp: 24.hours.from_now.to_i }
          token = JwtService.encode(payload)
          User.create(
            phone: login_request.phone,
            nickname: nickname,
            user_no: user_no,
            user_code: user_code,
            login_at: Time.current,
            login_token: token,
            client_ip: request.remote_ip,
            created_at: Time.current,
            created_by: '777'
          )
          login_response = LoginResponse.new(access_token:token)
          render json: ApiResponse.ok(login_response), status: :ok
        end
      else
        render json: ApiResponse.err, status: :bad_request
      end
    end

    def logout
      current_user.update(login_token: nil)
      render json: ApiResponse.ok
    end
  end
end
