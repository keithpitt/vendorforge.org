class AddPackageToVersions < ActiveRecord::Migration
  def change
    add_column :versions, :package, :string
  end
end
