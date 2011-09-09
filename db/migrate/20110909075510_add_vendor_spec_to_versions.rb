class AddVendorSpecToVersions < ActiveRecord::Migration
  def change
    add_column :versions, :vendor_spec, :text
  end
end
