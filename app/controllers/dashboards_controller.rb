class DashboardsController < ApplicationController
  before_action :authenticate_user!
  def student
    authorize :dashboard, :student?
    @announcements = Announcement.all
  end
  def show
    if current_user.super_admin?
      redirect_to super_admin_dashboard_path
    else
      redirect_to student_dashboard_path
    end
  end

  def admin
    authorize :dashboard, :super_admin?
  end

  def student
    authorize :dashboard, :student?
  end
end
