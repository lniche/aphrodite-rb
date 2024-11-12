class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!
  rescue_from StandardError, with: :handle_exception

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

  def handle_exception(exception)
    logger.error "Exception occurred: #{exception.message}"
    # logger.error exception.backtrace.join('\n')

    render json: ApiResponse.err(message: 'Internal Server Error'), status: 500
  end

end
