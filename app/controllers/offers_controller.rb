class OffersController < ApplicationController
  def show
    response = ResponseFormatter.new.get_offers
    render json: response, status: 200
  end

  def create
    OffersCrud.new(params.deep_symbolize_keys).create
    render json: {}, status: 201
  end

  def update
    OffersCrud.new(params.deep_symbolize_keys).update
    render json: {}, status: 204
  end

  def remove
    OffersCrud.new(params.deep_symbolize_keys).remove
    render json: {}, status: 204
  end
end
