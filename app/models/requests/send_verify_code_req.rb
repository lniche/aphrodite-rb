class Requests::SendVerifyCodeReq
  include ActiveModel::Model

  attr_accessor :phone

  validates :phone, presence: true, format: { with: /\A\d{11}\z/, message: "must be 11 digits" }

  def self.example
    { phone: "13800138000" }
  end
end
