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

  has_many :enrollments
  has_many :courses, through: :enrollments

  has_many :payments

  def total_paid
    payments.sum(:amount)
  end

  def pending_payments
    payments.where(status: "pending").sum(:amount)  # Assuming payments have a `status` column
  end

  private

  def set_default_role
    create_role(role_type: :student) unless role.present?
  end
end
