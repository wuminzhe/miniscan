class CreateExtrinsics < ActiveRecord::Migration[6.1]
  def change
    create_table :extrinsics do |t|
      t.string :index
      t.integer :block_id
      t.integer :block_number
      t.integer :timestamp
      t.string :length
      t.string :version_info
      t.string :call_code
      t.string :call_module_function
      t.string :call_module
      t.text :params
      t.string :account_id
      t.string :signature
      t.integer :nonce
      t.string :era
      t.string :hash
      t.boolean :is_signed
      t.boolean :success
      t.integer :fee, limit: 30
      t.integer :batch_index

      t.timestamps
    end
  end
end
