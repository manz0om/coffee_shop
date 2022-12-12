class ItemsController < ApplicationController

  def show
    response = Item.all
    response = response.map{|i| i.attributes}
    render json: { data: response.to_json }.to_json, status: 200
  end

  def add
    ItemsCrud.new(params.deep_symbolize_keys).add
    render json: {}, status: 201
  end

  def update
    ItemsCrud.new(params.deep_symbolize_keys).update
    render json: {}, status: 204
  end

  def remove
    ItemsCrud.new(params.deep_symbolize_keys).remove
    render json: {}, status: 204
  end
end
