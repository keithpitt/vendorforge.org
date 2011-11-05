class RemoveVendorColumnFromDownloads < ActiveRecord::Migration
  def change
    remove_column :downloads, :vendor_id
  end
end
