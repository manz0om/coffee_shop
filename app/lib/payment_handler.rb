class PaymentHandler
  attr_accessor :data

  def initialize(params)
    @data = params
  end

  def call
    case data[:status]
    when 'success'
      handle_success
    when 'failed', 'declined'
      handle_failure
    else
      handle_others
    end
  end

  private

  def order
    @order ||= Order.find_by(id: payment.order_id)
  end

  def payment
    @payment ||= Payment.find_by(id: data[:payment_id])
  end

  def handle_success
    payment.status = data[:status]
    order.status = 'accepted'
    ActiveRecord::Base.transaction do
      payment.save!
      order.save!
    end
  end

  def handle_failure
    payment.status = data[:status]
    order.status = 'declined'
    ActiveRecord::Base.transaction do
      payment.save!
      order.save!
    end
  end

  def handle_others
    payment.status = data[:status]
    payment.save!
  end
end