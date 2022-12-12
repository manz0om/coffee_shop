class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string :reference_id, null: false
      t.references :order, null: false, foreign_key: true
      t.string :status
      t.string :payment_link
      t.timestamps
    end
  end
end
