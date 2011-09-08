class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.integer :vendor_id
      t.integer :user_id
      t.string :number
      t.timestamps
    end

    add_index :versions, :vendor_id
    add_index :versions, :user_id
  end
end
