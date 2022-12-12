class PaymentController < ApplicationController
  def update
    PaymentHandler.new(params.deep_symbolize_keys).call
    render 'success', status: 200
  end
end
