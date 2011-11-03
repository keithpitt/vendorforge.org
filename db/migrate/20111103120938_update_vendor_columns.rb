class UpdateVendorColumns < ActiveRecord::Migration
  def change
    remove_column :vendors, :github
    add_column :vendors, :source, :string
    add_column :vendors, :docs, :string
  end
end
