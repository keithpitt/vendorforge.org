class AddSlugToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :slug, :string
    add_index :vendors, :slug, :unique => true
  end
end
