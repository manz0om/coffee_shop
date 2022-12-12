class OrderOperations
  attr_accessor: data

  def initialize(params)
    @data = params
  end

  def create
    result = {}
    order = Order.new(
      amount: data[:total]
      phone_number: data[:phone_number],
      table_number: data[:table_number]
      items: data[:items].to_json
      status: 'placed'
    )
    ActiveRecord::Base.transaction do
      order.save!
      order.reload!
      payment = Payment.new(
        order_id: order.id,
        payment_link: generate_payment_link,
        status: 'initiated'
      )
      payment.save!
      result[:status] = order.status
      result[:eta] = '30 minutes'
      result[:order_id] = order.id
      result[:amount] = order.amount
      result[:payment_link] = payment.payment_link
    end
    result
  end

  def get_status
    order = Order.find_by(id: data[:order_id])
    result = {
      order_id: order.id,
      order_status: order.status,
      order_payment_status: order.payments.status,
      eta: calculate_eta(order)
    }
  end

  def update_status(order_id:)
    order = Order.find_by(id: data[:order_id])
    order.status = data[:order_status]
    order.save!
    {
      order_id: order.id,
      order_status: order.status,
      order_payment_status: order.payments.status
      eta: calculate_eta(order)
    }
  end

  def notify
    order = Order.find_by(id: data[:order_id])
    send_notification_to_table(order.table_number) if order.table_number.present?
    send_notification_to_user(order.phone_number)
  end

  private

  def calculate_eta(order)
    30.0 - ((Time.now.utc - order.created_at)/1.minutes)
  end

  def generate_payment_link
    'https://coffee_shop.com/payment/uuid'
  end
end