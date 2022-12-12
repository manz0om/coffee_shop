class OffersCrud
  attr_accessor :data

  def initialize(params)
    @data = params[:data]
  end

  def create
    input = []
    data.each do |entry|
      row = Offer.new(
        name: entry[:offer_name],
        first_item_id: entry[:first_item_id],
        first_item_discount: entry[:first_item_discount],
        first_item_quantity: entry[:first_item_quantity]
        second_item_id: entry[:second_item_id],
        second_item_discount: entry[:second_item_discount],
        second_item_quantity: entry[:second_item_quantity]
      )
      input.push(row)
    end 
    ActiveRecord::Base.transaction do 
      result = Offer.import(input, on_duplicate_key_ignore: true)
      raise "error on saving offers" if result.failed_instances.present?
    end
  end

  def update
    data.each do |entry|
      row = Offer.find_by(id: entry[:offer_id])
      next unless row.present?
      entry[:attributes].each do |attribute|
        row[attribute[:name].to_sym] = row[attribute[:value]]
      end
      row.save!
    end
  end

  def remove
    data.each do |entry|
      row = Item.find_by(id: entry[:offer_id])
      next unless row.present?
      row.destroy
    end
  end
end