class Announcement < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true

  def urgent?
    urgent
  end
end
