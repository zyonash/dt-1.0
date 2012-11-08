class RemoveTimeDateFromEvents < ActiveRecord::Migration
  def up
    remove_column :events, :timedate
  end

  def down
    add_column :events, :timedate, :datetime
  end
end
