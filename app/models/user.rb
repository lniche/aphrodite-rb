class User < ApplicationRecord

  self.table_name = 't_user'

  validates :user_code, presence: true, uniqueness: true
  validates :user_no, presence: true, uniqueness: true
  validates :phone, presence: true, uniqueness: true

end
