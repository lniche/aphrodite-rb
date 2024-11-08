class Responses::LoginResp
  include ActiveModel::Model

  attr_accessor :access_token

  def self.example
    { access_token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..." }
  end
end