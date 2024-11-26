module V1
  class UsersController < ApplicationController
    before_action :authenticate_user!

    def get
      user_code = params[:user_code]
      user = if user_code.present?
        User.find_by(user_code: user_code)
      else
        nil
      end
      user ||= @current_user
      get_user_response = Responses::V1::GetUserResponse.new(
        nickname: user.nickname,
        user_no: user.user_no,
        user_code: user.user_code,
        email: user.email,
        phone: user.phone
      )
      render json: ApiResponse.ok(data:get_user_response)
    end

    def update
      update_user_requset = Requests::V1::UpdateUserRequest.new(params[:user])
      if update_user_requset.valid? && @current_user.update(update_user_requset.to_h)
        render json: ApiResponse.ok, status: :ok
      else
        render json: ApiResponse.err, status: :unprocessable_entity
      end
    end

    def destroy
      @current_user.update(deleted_at: Time.current, status: 3)
      render json: ApiResponse.ok, status: :ok
    end
  end
end
