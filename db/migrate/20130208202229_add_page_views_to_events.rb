class AddPageViewsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :page_views, :integer, :default => 0
  end
end
