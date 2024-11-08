class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  private

  def authenticate_user!
    token = request.headers['Authorization']&.split(' ')&.last
    decoded_token = JwtService.decode(token)
    if decoded_token
      @current_user = User.find(decoded_token['user_code'])
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end
