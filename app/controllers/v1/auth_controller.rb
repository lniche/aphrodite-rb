require 'snowflake'

module V1
  class AuthController < ApplicationController
    before_action :authenticate_user!, only: [:logout]

    def send_sms
      send_verify_code_request = Requests::V1::SendVerifyCodeRequest.new(params[:auth])
      if send_verify_code_request.valid?
        cache_key = "#{Constants::CacheKeys[:SMS_CODE]}#{send_verify_code_request.phone}"
        if Rails.cache.exist?(cache_key)
          return render json: ApiResponse.err(message: 'A verification code has already been sent within a minute, please try again later'), status: :unprocessable_entity
        end
        cache_code = rand(1000..9999).to_s
        Rails.cache.write(cache_key, cache_code, expires_in: 1.minute)
        Rails.logger.debug "cache code: #{cache_code}"
        # TODO: fake send
        render json: ApiResponse.ok, status: :ok
      else
        render json: ApiResponse.err, status: :bad_request
      end
    end

    def login
      login_request = Requests::V1::LoginRequest.new(params[:auth])
      if login_request.valid?
        cache_key = "#{Constants::CacheKeys[:SMS_CODE]}#{login_request.phone}"
        cache_code = Rails.cache.read(cache_key)
        if cache_code.nil? || cache_code != login_request.code
          return render json: ApiResponse.err("Verification code is incorrect, please re-enter"), status: :unauthorized
        end
        user = User.find_by(phone: login_request.phone)
        if user
          payload = { user_code: user.user_code, exp: 24.hours.from_now.to_i }
          token = JwtService.encode(payload)
          user.update(
            login_at: Time.current,
            login_token: token,
            client_ip: request.remote_ip,
          )
        else
          nickname = "SUGAR_#{login_request.phone[-4..-1]}"
          user_no = $redis.with do |redis|
            redis.incr(Constants::CacheKeys[:NEXT_UNO])
          end
          user_code = Snowflake.new(1, 1).generate_id
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
        end
        login_response = LoginResponse.new(access_token: user.login_token)
        Rails.cache.delete(cache_key)
        render json: ApiResponse.ok(login_response), status: :ok
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
