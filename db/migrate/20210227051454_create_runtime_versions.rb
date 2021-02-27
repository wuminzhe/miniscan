class CreateRuntimeVersions < ActiveRecord::Migration[6.1]
  def change
    create_table :runtime_versions do |t|
      t.string :name
      t.integer :spec_version
      t.string :modules
      t.string :raw_data

      t.timestamps
    end
  end
end
