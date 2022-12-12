class ItemsCrud
  attr_accessor :data

  def initialize(params)
    @data = params[:data]
  end

  def create
    input = []
    data.each do |entry|
      row = Item.new(
        name: entry[:item_name],
        price: entry[:item_price],
        tax_rate: entry[:item_tax],
        item_category_id: entry[:item_category_id]
      )
      input.push(row)
    end
    ActiveRecord::Base.transaction do 
      result = Item.import(input, on_duplicate_key_ignore: true)
      raise "error on saving items" if result.failed_instances.present?
    end
  end

  def update
    data.each do |entry|
      row = Item.find_by(id: entry[:item_id])
      next unless row.present?
      entry[:attributes].each do |attribute|
        row[attribute[:name].to_sym] = row[attribute[:value]]
      end
      row.save!
    end
  end

  def remove
    data.each do |entry|
      row = Item.find_by(id: entry[:item_id])
      next unless row.present?
      row.destroy
    end
  end
end