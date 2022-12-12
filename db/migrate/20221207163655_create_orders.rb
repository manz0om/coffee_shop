class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.decimal :amount, null: false
      t.string :status
      t.json :items, null: false
      t.integer :customer_phone_number, null: false
      t.integer :table_number
      t.references :offer, null: true, foreign_key: true
      t.timestamps
    end
  end
end
