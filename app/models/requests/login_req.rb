class Requests::LoginReq
  include ActiveModel::Model

  attr_accessor :phone, :code

  validates :phone, presence: true, format: { with: /\A\d{11}\z/, message: "must be 11 digits" }
  validates :code, presence: true, length: { is: 4, message: "must be 4 digits" }

  def self.example
    { phone: "13800138000", code: "1234" }
  end
end



class Requests::SendVerifyCodeReq
  include ActiveModel::Model

  attr_accessor :phone

  validates :phone, presence: true, format: { with: /\A\d{11}\z/, message: "must be 11 digits" }

  def self.example
    { phone: "13800138000" }
  end
end
