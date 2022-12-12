class ResponseFormatter

  def get_menu
    item_categories = ItemCategory.all
    result = []
    item_categories.each do |category|
      row = {
        category_id: category.id,
        category_name: category.name,
        items: []
      }
      category.items.each do |i|
        next unless i.availability
        itm = {
          item_id: i.id,
          item_name: i.name,
          item_price: i.price.to_f,
          item_tax: i.tax_rate.to_f
        }
        row[:items].push(itm)
      end
      result.push(row)
    end
    return { data: result }
  end

  def get_offers
    offers = Offer.where(validity: true)
    result = []
    offers.each do |offer|
      row = {
        offer_id: offer.id,
        offer_name: offer.name,
        offer_price: offer.price.to_f,
        items: []
      }
      first_item = Item.find_by(id: offer.first_item_id)
      row[:items].push(
        {
          item_id: first_item.id,
          item_name: first_item.name,
          item_price: first_item.price.to_f,
          item_quantity: offer.first_item_quantity,
          item_discount: offer.first_item_discount.to_f
        }
      )
      second_item = nil
      if(offer.second_item_id.present?)
        second_item = Item.find_by(id: offer.second_item_id)
        row[:items].push(
          {
            item_id: second_item.id,
            item_name: second_item.name,
            item_price: second_item.price.to_f,
            item_quantity: offer.second_item_quantity,
            item_discount: offer.second_item_discount.to_f
          }
        )
      end
      next unless(first_item.availability)
      next if(second_item.present? && !second_item.availability)
      result.push(row)
    end
    return { data: result }
  end
end