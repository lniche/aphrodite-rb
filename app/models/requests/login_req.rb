class Requests::LoginReq
  include ActiveModel::Validations

  attr_accessor :phone, :code

  validates :phone, :code, presence: true, allow_blank: false

  def initialize(params)
    @phone = params[:phone]
    @code = params[:code]
  end

  def to_h
    {
      phone: @phone,
      code: @code
    }
  end
end
