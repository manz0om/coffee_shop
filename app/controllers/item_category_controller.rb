class ItemCategoryController < ApplicationController

  def show
    response = ItemCategory.all
    response = response.map{|i| i.attributes}
    render json: response.to_json, status: 200
  end

  def add
    ItemCategoriesCrud.new(params.deep_symbolize_keys).create
    render json: {}, status: 201
  end

  def update
    ItemCategoriesCrud.new(params.deep_symbolize_keys).update
    render json: {}, status: 204
  end

  def remove
    ItemCategoriesCrud.new(params.deep_symbolize_keys).remove
    render json: {}, status: 204
  end
end
