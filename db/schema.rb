# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_07_163732) do
  create_table "item_categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.decimal "price", null: false
    t.decimal "tax_rate"
    t.boolean "availability", default: true, null: false
    t.integer "item_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_category_id"], name: "index_items_on_item_category_id"
  end

  create_table "offers", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "price", null: false
    t.integer "first_item_id", null: false
    t.integer "second_item_id"
    t.decimal "first_item_discount", default: "0.0", null: false
    t.decimal "second_item_discount", default: "0.0"
    t.integer "first_item_quantity", default: 1, null: false
    t.integer "second_item_quantity", default: 0
    t.boolean "validity", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["first_item_id"], name: "index_offers_on_first_item_id"
    t.index ["second_item_id"], name: "index_offers_on_second_item_id"
  end

  create_table "orders", force: :cascade do |t|
    t.decimal "amount", null: false
    t.string "status"
    t.json "items", null: false
    t.integer "customer_phone_number", null: false
    t.integer "offer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_orders_on_offer_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "reference_id", null: false
    t.integer "order_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_payments_on_order_id"
  end

  add_foreign_key "items", "item_categories"
  add_foreign_key "offers", "items", column: "first_item_id"
  add_foreign_key "offers", "items", column: "second_item_id"
  add_foreign_key "orders", "offers"
  add_foreign_key "payments", "orders"
end
