class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
      t.integer :vendor_id
      t.integer :version_id
      t.timestamps
    end

    add_index :downloads, :vendor_id
    add_index :downloads, :version_id
  end
end
