class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_one :role
  after_create :set_default_role

  def student?
    role&.student?
  end

  def super_admin?
    role&.super_admin?
  end

  private

  def set_default_role
    create_role(role_type: :student) unless role.present?
  end
end
