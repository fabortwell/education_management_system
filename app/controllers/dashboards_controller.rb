class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    if current_user.super_admin?
      redirect_to admin_dashboard_path
    else
      redirect_to student_dashboard_path
    end
  end

  def admin
    authorize :dashboard, :super_admin?
    # Admin-specific data fetching
  end

  def student
    authorize :dashboard, :student?
    # Student-specific data fetching
  end
end
