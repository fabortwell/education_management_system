class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    authorize :dashboard
    if current_user.super_admin?
      @courses = Course.all
      @revenue_data = {
        labels: [ "Jan", "Feb", "Mar", "Apr", "May", "Jun" ],
        values: [ 65000, 79000, 82000, 73000, 91000, 99000 ]
      }
    end
  end
end
