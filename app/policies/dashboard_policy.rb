class DashboardPolicy < ApplicationPolicy
  def student?
    user.student?
  end

  def admin?
    user.super_admin?
  end
end
