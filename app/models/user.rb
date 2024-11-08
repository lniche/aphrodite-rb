class User < ApplicationRecord
  
  self.table_name = 't_user'

  validates :user_code, presence: true, uniqueness: true
  validates :user_no, presence: true, uniqueness: true
  validates :phone, presence: true, uniqueness: true
  validates :status, inclusion: { in: [0, 1, 2, 3], message: "%{value} is not a valid status" }

  scope :active, -> { where(status: 1) }
  
  scope :unactivated, -> { where(status: 0) }

  scope :frozen, -> { where(status: 2) }

  scope :deleted, -> { where(status: 3) }

  def deactivate
    update(status: 2)
  end

  def activate
    update(status: 1) 
  end

  def restore
    update(status: 1, deleted_at: nil) 
  end

  def soft_delete
    update(status: 3, deleted_at: Time.current) 
  end

  def deleted?
    status == 3
  end

  def self.find_by_user_code(user_code)
    find_by(user_code: user_code)
  end
end
