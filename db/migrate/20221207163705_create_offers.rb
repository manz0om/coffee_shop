class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.string :name, null: false
      t.decimal :price, null: false
      t.references :first_item, null: false, foreign_key: { to_table: 'items' }
      t.references :second_item, null: true, foreign_key: { to_table: 'items' }
      t.decimal :first_item_discount, null: false, default: 0.0
      t.decimal :second_item_discount, null: true, default: 0.0
      t.integer :first_item_quantity, null: false, default: 1 
      t.integer :second_item_quantity, null: true, default: 0
      t.boolean :validity, default: true
      t.timestamps
    end
  end
end
