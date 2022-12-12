class OrderController < ApplicationController
  def create
    response = OrderOperations.new(params.deep_symbolize_keys).create
    renter json: response, status: 201
  end

  def status
    response = OrderOperations.new(params.deep_symbolize_keys).get_status
    render json: response, status: 200
  end

  def update_status
    response = OrderOperations.new(params.deep_symbolize_keys).update_status
    render json: response, status: 204
  end

  def notify
    OrderOperations.new(params.deep_symbolize_keys).notify
    render json: {success: true}, status: 204
  end
end
