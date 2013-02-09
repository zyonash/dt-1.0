class DeleteViewCountFromEvents < ActiveRecord::Migration
  def change
	remove_column :events, :page_views
  end
end
