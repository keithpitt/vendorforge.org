class CreatePackageOnVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :package, :string
  end
end
