class GetUserResponse
  attr_accessor :nickname, :user_no, :user_code, :email, :phone

  def initialize(nickname: nil, user_no: nil, user_code: nil, email: nil, phone: nil)
    @nickname = nickname
    @user_no = user_no
    @user_code = user_code
    @email = email
    @phone = phone
  end

  def to_h
    {
      nickname: @nickname,
      user_no: @user_no,
      user_code: @user_code,
      email: @email,
      phone: @phone
    }
  end
end
