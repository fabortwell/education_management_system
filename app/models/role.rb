class Role < ApplicationRecord
  enum role_type: { student: 0, super_admin: 1 }
  belongs_to :user
end
