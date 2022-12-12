class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name, length: 191
      t.decimal :price, null: false
      t.decimal :tax_rate
      t.boolean :availability, null: false, default: true
      t.references :item_category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
