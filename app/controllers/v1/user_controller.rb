module V1
  class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, only: [:get, :update, :destroy]

    def get
      render json: @user
    end

    def update
      if @user.update(user_params)
        render json: @user, status: :ok
      else
        render json: { error: @user.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def destroy
      @user.update(deleted_at: Time.current, status: 3)
      head :no_content
    end

    private

    def set_user
      @user = current_user
    end

    def user_params
      params.require(:user).permit(:nickname, :email)
    end
  end
end
