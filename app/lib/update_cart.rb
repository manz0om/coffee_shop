class UpdateCart
  attr_accessor :selected_items

  def initialize(params)
    @selected_items = params[:data]
    @total_price = 0.0
  end

  def call
    items = Item.where(id: selected_items.collect{|i| i[:item_id]})
    item_list = items.map{|i| [i.id,i]}.to_h
    result = []
    offers = get_offers_on_items(item_list.keys)
    item_list.each do |id, val|
      row = {
        category_id: val[:category_id],
        item_id: id,
        item_name: val[:name]
        item_quantity: val[:item_quantity]
        item_tax: val
      }
      calculate_price(val, offers, item_list)
    end
  end

  private

  def get_offers_on_items(item_ids)
    Offer.where(first_item_id: item_ids).or(Offer.where(second_item_id: item_ids))
  end

  def calculate_price(item, offers)
    price = 0.0
    item.offers.each do |offer|

    end
  end
end

=begin
{
 data: [
  {item_id: 1, item_name: 'a', item_quantity: 1, category_id: 1},
  {item_id: 2, item_name: 'b', item_quantity: 1, category_id: 1},
  {item_id: 3, item_name: 'c', item_quantity: 1, category_id: 2},
  {item_id: 4, item_name: 'd', item_quantity: 1, category_id: 2}
 ]
}
=end