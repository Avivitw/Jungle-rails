class OrderMailer < ApplicationMailer
  default from: ENV['email']
 
  def order_email(order)
    @order = order
    @order_id = order.id
    @email = @order.email
    mail(to: @email, subject: 'Your order from Jungle')
  end

end
