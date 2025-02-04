class DashboardPolicy < ApplicationPolicy
  def show?
    true # Accessible to all logged-in users
  end
end
