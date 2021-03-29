class CreateLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :logs do |t|
      t.integer :block_id
      t.integer :block_number
      t.string :index
      t.string :type
      t.text :raw
      t.boolean :finalized

      t.timestamps
    end
  end
end
