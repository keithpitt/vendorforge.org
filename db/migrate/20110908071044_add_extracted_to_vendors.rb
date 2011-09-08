class AddExtractedToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :extracted, :boolean
    add_index :vendors, :extracted
  end
end
