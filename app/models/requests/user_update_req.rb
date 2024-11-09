class Requests::UserUpdateReq
  include ActiveModel::Validations

  attr_accessor :nickname, :email

  validates :nickname, :email

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
