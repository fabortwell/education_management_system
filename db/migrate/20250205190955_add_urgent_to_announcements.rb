class AddUrgentToAnnouncements < ActiveRecord::Migration[8.0]
  def change
    add_column :announcements, :urgent, :boolean
  end
end
