class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.string :name
      t.string :location
      t.string :contact
      t.text :description

      t.timestamps
    end
  end
end
