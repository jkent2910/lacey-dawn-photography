class CartMailer < ApplicationMailer
  default from: 'lacey.hike@gmail.com'

  def send_cart(client)
    @carts = client.carts
    @client = client

    to_emails = "jkent2910@gmail.com, lacey.hike@gmail.com"
    mail(:to => to_emails,
         :subject => "New Cart Submitted")

  end
end
