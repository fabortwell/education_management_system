class Course < ApplicationRecord
  has_many :enrollments
  has_many :users, through: :enrollments

  def status_class
    active? ? "course-status-active" : "course-status-archived"
  end

  def student_progress(student)
    # Implement your progress calculation logic
    enrollments.find_by(user: student)&.progress || 0
  end

  def enrolled?(student)
    enrollments.exists?(user: student)
  end
end
