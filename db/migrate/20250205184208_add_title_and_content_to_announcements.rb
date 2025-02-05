class AddTitleAndContentToAnnouncements < ActiveRecord::Migration[8.0]
  def change
    add_column :announcements, :title, :string
    add_column :announcements, :content, :text
  end
end
