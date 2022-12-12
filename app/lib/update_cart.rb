class UpdateCart
  attr_accessor :selected_items

  def initialize(params)
    @selected_items = params[:data]
    @selected_items = @selected_items.map{|i| [i[:item_id],i]}.to_h
    @total_price = 0.0
  end

  def call
    items = Item.where(id: selected_items.collect{|i| i[:item_id]})
    item_list = items.map{|i| [i.id,i]}.to_h
    result = []
    total = 0
    offers = get_offers_on_items(item_list.keys)
    item_list.each do |id, val|
      row = {
        category_id: val[:category_id],
        item_id: id,
        item_name: val[:name]
        item_quantity: val[:item_quantity]
        item_tax: val
      }
      price = calculate_price(val, offers)
      row[:price] = price
      total += price
      result.push(price)
    end
    return {
      data: result,
      total: total
    }
  end

  private

  def get_offers_on_items(item_ids)
    Offer.where(first_item_id: item_ids).or(Offer.where(second_item_id: item_ids))
  end

  def calculate_price(item, offers)
    min_price = (item.price + (price * item.tax/100.0)) * selected[item.id][:item_quantity]
    item.offers.each do |offer|
      price = item.price - (item.price * offer.first_item_discount/100.0)
      price = (price + (price * item.tax/100.0)) * selected[item.id][:item_quantity]
      min_price = [min_price, price].min
    end

    item.combo_offers.each do |offer|
      price = item.price - (item.price * offer.second_item_discount/100.0)
      price = (price + (price * item.tax/100.0)) * selected[item.id][:item_quantity]
      min_price = [min_price, price].min
    end
    return min_price
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