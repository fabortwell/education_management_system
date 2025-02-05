class DashboardPolicy < ApplicationPolicy
  def show?
    user.student? || user.super_admin?
  end
end
