class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.integer :vendor_id
      t.string :name
      t.timestamps
    end
    add_index :authors, :vendor_id
  end
end
