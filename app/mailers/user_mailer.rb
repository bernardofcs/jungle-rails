class UserMailer < ApplicationMailer
  default from: "no_reply@jungle.com"
  def order_receipt(order)
    @order = order
    # @url  = 'http://example.com/login'
    puts @order.email
    mail(to: @order.email, subject: "Order##{order.id} Receipt")
  end
end
