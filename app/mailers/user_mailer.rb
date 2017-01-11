class UserMailer < ApplicationMailer
	default from: "xavier@adkicker.io"

  def contact_form(email, name, message)
  @message = message
  @name = name
    mail(:from => email,
        :to => 'xavier@adkicker.io',
        :subject => "A new contact form message from #{name}")
  end
end
