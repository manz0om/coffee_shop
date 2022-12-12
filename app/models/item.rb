class Item < ApplicationRecord
  belongs_to :item_category
  has_many :offers, class_name: 'Offer', foreign_key: 'first_item_id'
  has_many :combo_offers, class_name: 'Offer', foreign_key: 'second_item_id'
end
