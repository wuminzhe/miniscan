class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :index
      t.integer :idx
      t.integer :block_id
      t.integer :block_number
      t.integer :extrinsic_idx
      t.string :type
      t.string :module_id
      t.string :event_id
      t.text :params
      t.string :extrinsic_hash

      t.timestamps
    end
  end
end
