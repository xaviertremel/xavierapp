class UserMailer < ApplicationMailer
	default from: "no_reply@berlinbikeshop.com"
  layout 'mailer'

  def contact_form(email, name, message)
  @message = message
  @name = name
    mail(:from => email,
        :to => 'xavier@adkicker.io',
        :subject => "A new contact form message from #{name}")
  end

  def order_confirmation(email, user_name, product_name, price)
  	@product_name = product_name
  	@email = email
    @name = user_name.titleize
    @price = (price.fractional/100).to_f
    render :file => 'user_mailer/order_confirmation.html.erb', :layout => 'mailer'
    	mail(:from => 'no_reply@berlinbikeshop.com',
      	  :to => email,
      	  :subject => "Order confirmed: #{product_name} for #{price} €")
  end

  def new_user(email)
    @email = email
    render :file => 'application_mailer/new_user.html.erb', :layout => 'mailer'
      mail(:from => 'no_reply@berlinbikeshop.com',
          :to => 'xavier@adkicker.io',
          :subject => "New User: #{email}")
  end
  
end
