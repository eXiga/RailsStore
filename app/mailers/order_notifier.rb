class OrderNotifier < ApplicationMailer
  default from: ''
  def received(order)
    @order = order
    mail to: order.email, subject: 'Store confimation'
  end

  def shipped(order)
    @order = order
    mail to: order.email, subject: 'Order shipped'
  end
end
