class ItemCategoriesCrud
  attr_accessor :data

  def initialize(params)
    @data = params[:data]
  end

  def add
    input = []
    data.each do |entry|
      row = ItemCategory.new(
        name: entry[:item_category_name],
      )
      input.push(row)
    end
    ActiveRecord::Base.transaction do 
      result = ItemCategory.import(input, on_duplicate_key_ignore: true)
      raise "error on saving item categories" if result.failed_instances.present?
    end
  end

  def update
    input = []
    data.each do |entry|
      row = ItemCategory.find_by(id: entry[:item_category_id])
      next unless row.present?
      entry[:attributes].each do |attribute|
        row[attribute[:name].to_sym] = row[attribute[:value]]
      end
      row.save!
    end
  end

  def remove
    input = []
    data.each do |entry|
      row = ItemCategory.find_by(id: entry[:item_category_id])
      next unless row.present?
      row.destroy
    end
  end
end