module V1
  class UsersController < ApplicationController
    before_action :set_user, only: %i[show update destroy]

    # GET /api/v1/users/:id
    swagger_controller :users, '用户管理'

    swagger_api :show do
      summary '获取用户信息'
      param :path, :id, :integer, :required, '用户ID'
      response :ok, '成功', :User
      response :not_found, '未找到用户'
    end
    def show
      render json: @user
    end

    # PUT /api/v1/users/:id
    swagger_api :update do
      summary '更新用户信息'
      param :path, :id, :integer, :required, '用户ID'
      param :body, :user, :object, :required, '用户信息', properties: {
        name: { type: 'string', description: '用户姓名' },
        email: { type: 'string', description: '用户邮箱' }
      }
      response :ok, '更新成功', :User
      response :not_found, '未找到用户'
      response :unprocessable_entity, '参数无效'
    end
    def update
      if @user.update(user_params)
        render json: @user, status: :ok
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # DELETE /api/v1/users/:id
    swagger_api :destroy do
      summary '删除用户'
      param :path, :id, :integer, :required, '用户ID'
      response :no_content, '删除成功'
      response :not_found, '未找到用户'
    end
    def destroy
      @user.destroy
      head :no_content
    end

    private

    def set_user
      @user = User.find_by(id: params[:id])
      render json: { error: '用户未找到' }, status: :not_found unless @user
    end

    def user_params
      params.require(:user).permit(:name, :email)
    end
  end
end
