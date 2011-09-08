class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.integer :user_id
      t.string :name
      t.string :homepage
      t.string :github
      t.text :description
      t.timestamps
    end

    add_index :vendors, :user_id
  end
end
