class AddNameIndexToVendors < ActiveRecord::Migration
  def change
    add_index :vendors, :name
  end
end
