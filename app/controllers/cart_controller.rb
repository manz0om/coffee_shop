class CartController < ApplicationController
  def update
    response = UpdateCart.new(params.deep_symbolize_keys).call
    render json: response, status: 204
  end
end
