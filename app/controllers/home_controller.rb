class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def root
    render plain: 'Thank you for using Aphrodite!'
  end

  def ping
    render json: { code: '0',message: 'pong', data:nil }
  end
end
