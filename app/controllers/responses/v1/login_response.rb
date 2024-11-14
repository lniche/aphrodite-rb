module Responses
  module V1
    class LoginResponse
      attr_reader :access_token
    
      def initialize(access_token)
        @access_token = access_token
      end
    
      def to_h
        { access_token: @access_token }
      end
    end
  end
end

