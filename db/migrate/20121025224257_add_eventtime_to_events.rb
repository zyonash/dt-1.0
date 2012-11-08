class AddEventtimeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :eventtime, :time
  end
end
