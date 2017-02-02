class UserMailer < ApplicationMailer
	default from: "xavier@adkicker.io"

  def contact_form(email, name, message)
  @message = message
  @name = name
    mail(:from => email,
        :to => 'xavier@adkicker.io',
        :subject => "A new contact form message from #{name}")
  end

  def order_confirmation(email, product_id)
  	@product_id = product_id
  	@email = email
    	mail(:from => 'xavier@adkicker.io',
      	  :to => email,
      	  :subject => "Order confirmed: #{product_id}")
  end
end
