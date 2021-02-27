class CreateBlocks < ActiveRecord::Migration[6.1]
  def change
    create_table :blocks do |t|
      t.integer :number
      t.integer :timestamp
      t.string :hash
      t.string :parent_hash
      t.string :state_root
      t.string :extrinsics_root
      t.string :logs
      t.text :extrinsics
      t.integer :event_count
      t.integer :extrinsic_count
      t.text :events
      t.integer :spec_version
      t.string :validator
      t.boolean :codec_error
      t.boolean :finalized

      t.timestamps
    end
  end
end
