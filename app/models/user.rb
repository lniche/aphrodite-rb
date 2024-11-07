class User < ApplicationRecord
  # 指定表名
  self.table_name = 't_user'

  # Validations (验证)
  validates :user_code, presence: true, uniqueness: true
  validates :user_no, presence: true, uniqueness: true
  validates :phone, presence: true, uniqueness: true
  validates :status, inclusion: { in: [0, 1, 2, 3], message: "%{value} is not a valid status" }

  # Scopes (作用域)
  # 活跃用户，状态为 1
  scope :active, -> { where(status: 1) }
  
  # 未激活用户，状态为 0
  scope :unactivated, -> { where(status: 0) }

  # 冻结的用户，状态为 2
  scope :frozen, -> { where(status: 2) }

  # 被删除的用户，状态为 3
  scope :deleted, -> { where(status: 3) }

  # 方法：禁用用户，将状态设为冻结
  def deactivate
    update(status: 2) # 假设 2 代表冻结状态
  end

  # 方法：激活用户，将状态设为活跃
  def activate
    update(status: 1) # 假设 1 代表活跃状态
  end

  # 方法：恢复已删除的用户
  def restore
    update(status: 1, deleted_at: nil) # 恢复为活跃状态并清空删除时间
  end

  # 方法：软删除用户
  def soft_delete
    update(status: 3, deleted_at: Time.current) # 假设 3 代表删除状态
  end

  # 软删除时更新 deleted_at 字段
  def deleted?
    status == 3
  end

  # 可以根据需求实现更多的业务逻辑方法
  # 示例：根据 user_code 查找用户
  def self.find_by_user_code(user_code)
    find_by(user_code: user_code)
  end
end
