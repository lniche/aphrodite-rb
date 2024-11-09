module V1
  class UsersController < ApplicationController
    before_action :authenticate_user!

    def get
      user_code = params[:user_code]
      user = User.find_by_user_code(user_code)
      if user
        render json: user, only: [:user_code, :user_no, :phone, :nickname, :email]
      else
        render json: @current_user, only: [:user_code, :user_no, :phone, :nickname, :email]
      end
    end

    def update
      update_req = Requests::UserUpdateReq.new(params[:user])
      if update_req.valid? && @current_user.update(user_params.to_h)
        render json: ApiResponse.ok(), status: :ok
      else
        render json: ApiResponse.err(), status: :unprocessable_entity
      end
    end

    def destroy
      @current_user.update(deleted_at: Time.current, status: 3)
      render json: ApiResponse.ok(), status: :ok
    end

  end
end
