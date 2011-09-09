class AddAuthorsToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :authors, :string
  end
end
