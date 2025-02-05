class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :payments
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
  has_many :announcements
  has_many :payments

  def total_paid
    payments.sum(:amount)
  end

  def pending_payments
    payments.where(status: "pending").sum(:amount)
  end

  def next_payment_due
    last_payment = payments.order(created_at: :desc).first
    last_payment ? last_payment.created_at + 30.days : nil # Assuming monthly payments
  end

  def last_payment_date
    payments.order(created_at: :desc).limit(1).pluck(:created_at).first
  end
  private

  def set_default_role
    create_role(role_type: :student) unless role.present?
  end
end
