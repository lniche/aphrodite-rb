require 'snowflake'

module V1
  class AuthController < ApplicationController
    before_action :authenticate_user!, only: [:logout]

    def send_sms
      send_verify_code_req = Requests::SendVerifyCodeReq.new(params[:auth])
      if send_verify_code_req.valid?
        code = rand(1000..9999).to_s
        logger.info("Sending SMS code: phone=#{send_verify_code_req.phone}, code=#{code}")
        Rails.cache.write("sms_code_#{send_verify_code_req.phone}", code, expires_in: 5.minutes)
        # TODO: fake send
        render json: ApiResponse.ok, status: :ok
      else
        render json: ApiResponse.err, status: :bad_request
      end
    end

    def login
      login_req = Requests::LoginReq.new(params[:auth])
      if login_req.valid?
        if login_req.code != '9999' || !(Rails.env.development? || Rails.env.test?)
          cached_code = Rails.cache.read("sms:code:#{login_req.phone}")
          if cached_code.nil? || cached_code != login_req.code
            return render json: ApiResponse.err,
                          status: :unauthorized
          end
        end
        user = User.find_by(phone: login_req.phone)
        if user
          payload = { user_code: user.user_code, exp: 24.hours.from_now.to_i }
          token = JwtService.encode(payload)
          user.update(login_at: Time.current, login_token: token)
          render json: ApiResponse.ok, status: :ok
        else
          nickname = "SUGAR_#{login_req.phone[-4..-1]}"
          redis = Rails.application.config.redis
          user_no = redis.get('next:uno') || 100_000
          redis.set('next:uno', user_no) if user_no == 100_000
          user_no = redis.incr('next:uno')
          snowflake = Snowflake.new(1, 1)
          user_code = snowflake.generate_id
          payload = { user_code: user_code, exp: 24.hours.from_now.to_i }
          token = JwtService.encode(payload)
          User.create(
            phone: login_req.phone,
            nickname: nickname,
            user_no: user_no,
            user_code: user_code,
            login_at: Time.current,
            login_token: token,
            client_ip: request.remote_ip,
            created_at: Time.current,
            created_by: '777'
          )
          render json: ApiResponse.ok, status: :ok
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
