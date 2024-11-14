module Requests
  module V1
    class SendVerifyCodeRequest
      include ActiveModel::Validations

      attr_accessor :phone

      validates :phone, presence: true, allow_blank: false

      def initialize(params)
        @phone = params[:phone]
      end

      def to_h
        {
          phone: @phone
        }
      end
    end

  end
end