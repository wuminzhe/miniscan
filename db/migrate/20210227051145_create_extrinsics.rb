class CreateExtrinsics < ActiveRecord::Migration[6.1]
  def change
    create_table :extrinsics do |t|
      t.string :index
      t.integer :block_id
      t.integer :block_number
      # t.text :raw
      # t.integer :timestamp
      t.string :length
      t.string :version_info
      t.string :module
      t.string :function
      t.string :params_raw
      t.text :params
      t.string :account_id
      t.string :signature
      t.integer :nonce
      t.string :era
      t.string :hash
      t.boolean :is_signed
      t.boolean :success
      t.integer :fee
      t.integer :batch_index

      t.timestamps
    end
  end
end
