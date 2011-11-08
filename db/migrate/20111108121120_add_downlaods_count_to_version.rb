class AddDownlaodsCountToVersion < ActiveRecord::Migration
  def change
    add_column :versions, :downloads_count, :integer, :default => 0

    VendorForge::Version.reset_column_information
    VendorForge::Version.all.each { |version|
      VendorForge::Version.update_counters version.id, :downloads_count => version.downloads.count
    }
  end
end
