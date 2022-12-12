class Offer < ApplicationRecord
  belongs_to :first_item, class_name: 'Item', foreign_key: 'first_item_id'
  belongs_to :second_item, class_name: 'Item', foreign_key: 'second_item_id', optional: true
  before_validation :set_price

  private

  def item_info(item_id)
    Item.find_by(id: item_id)
  end
  
  def set_price # inclusive of tax
    item1 = item_info(self.first_item_id)
    item2 = item_info(self.second_item_id)
    self.price = ((item1.price - (item1.price * self.first_item_discount/100.0) + (item1.price * item1.tax_rate/100.0)) * self.first_item_quantity).round(2).to_f
    self.price += ((item2.price - (item2.price * self.second_item_discount/100.0) + (item2.price * item2.tax_rate/100.0)) * self.second_item_quantity).round(2).to_f if item2.present?
  end
end
