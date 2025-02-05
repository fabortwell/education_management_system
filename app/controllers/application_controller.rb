class ApplicationController < ActionController::Base
  include Pundit::Authorization

  def after_sign_in_path_for(resource)
    # Redirect to dashboard after successful login
    dashboard_path
  end

  def after_sign_out_path_for(resource)
    # Redirect to root path after logout
    root_path
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
