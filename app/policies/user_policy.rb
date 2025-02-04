class UserPolicy < ApplicationPolicy
  def manage?
    user.super_admin?
  end

  def permitted_attributes
    if user.super_admin?
      [ :email, :password, :password_confirmation, role_attributes: [ :role_type ] ]
    else
      [ :email, :password, :password_confirmation ]
    end
  end
end
