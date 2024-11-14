module Requests
  module V1
    class UpdateUserRequest

      attr_accessor :nickname, :email
    
      def initialize(params)
        @nickname = params[:nickname]
        @email = params[:email]
      end
    
      def to_h
        {
          nickname: @nickname,
          email: @email
        }
      end
    end
  end
end


