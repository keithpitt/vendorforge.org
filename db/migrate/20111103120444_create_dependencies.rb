class CreateDependencies < ActiveRecord::Migration
  def change
    create_table :dependencies do |t|
      t.integer :version_id
      t.string :name
      t.string :number
      t.timestamps
    end

    add_index :dependencies, :version_id
  end
end
