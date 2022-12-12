# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ActiveRecord::Base.connection.execute("Delete from payments")
ActiveRecord::Base.connection.execute("Delete from offers")
ActiveRecord::Base.connection.execute("Delete from orders")
ActiveRecord::Base.connection.execute("Delete from items")
ActiveRecord::Base.connection.execute("Delete from item_categories")



cat1 = ItemCategory.create!(name: 'Coffee')
cat2 = ItemCategory.create!(name: 'Sandwiches')
cat3 = ItemCategory.create!(name: 'Extras')


i1 = Item.create!(name: 'Latte', price: 50, tax_rate: 1, item_category_id: cat1.id)
i2 = Item.create!(name: 'Cappuccino', price: 45, tax_rate: 2, item_category_id: cat1.id)
i3 = Item.create!(name: 'Espresso', price: 45, tax_rate: 2, item_category_id: cat1.id)
i4 = Item.create!(name: 'Iced Coffee', price: 50, tax_rate: 1.5, item_category_id: cat1.id)
i5 = Item.create!(name: 'Decaf', price: 50, tax_rate: 2.5, item_category_id: cat1.id)

i6 = Item.create!(name: 'Chicken Sandwich', price: 50, tax_rate: 0.5, item_category_id: cat2.id)
i7 = Item.create!(name: 'Egg Sandwich', price: 40, tax_rate: 1, item_category_id: cat2.id)
i8 = Item.create!(name: 'Fish Sandwich', price: 55, tax_rate: 2, item_category_id: cat2.id)
i9 = Item.create!(name: 'Cheese Sandwich', price: 35, tax_rate: 1.5, item_category_id: cat2.id)

i10 = Item.create!(name: 'Water', price: 10, tax_rate: 1, item_category_id: cat3.id)
i11 = Item.create!(name: 'Pepsi', price: 15, tax_rate: 2, item_category_id: cat3.id)
i12 = Item.create!(name: 'Coke', price: 15, tax_rate: 2, item_category_id: cat3.id)
i13 = Item.create!(name: 'Nachos', price: 30, tax_rate: 1.5, item_category_id: cat3.id)
i14 = Item.create!(name: 'Fries', price: 40, tax_rate: 1.5, item_category_id: cat3.id)

Offer.create!(name: '20% off on Decaf', first_item_id: i5.id, first_item_discount: 20)
Offer.create!(name: '10% off on Chicken Sandwich', first_item_id: i6.id, first_item_discount: 10)
Offer.create!(name: 'Fries free with Cheese Sandwich', first_item_id: i9.id, second_item_id: i14.id, second_item_discount: 100, second_item_quantity: 1)
Offer.create!(name: '25% off on Iced Coffee with Fish Sandwich', first_item_id: i8.id, second_item_id:i4.id , second_item_discount: 25, second_item_quantity: 1)
Offer.create!(name: '15% off on Pepsi with Egg Sandwich', first_item_id: i7.id, second_item_id:i11.id , second_item_discount: 15, second_item_quantity: 1)
Offer.create!(name: '15% off on Pepsi with Chicken Sandwich', first_item_id: i6.id, second_item_id:i11.id , second_item_discount: 15, second_item_quantity: 1)