class CreateSystemAttributes < ActiveRecord::Migration[6.1]
  def change
    create_table :system_attributes do |t|
      t.string :name
      t.string :value

      t.timestamps
    end
    SystemAttribute.create name: 'start_block_number', value: '0'
  end
end
