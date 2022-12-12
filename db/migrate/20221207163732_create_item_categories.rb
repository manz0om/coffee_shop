class CreateItemCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :item_categories do |t|
      t.string :name, length: 191, null: false
      t.timestamps
    end
  end
end
