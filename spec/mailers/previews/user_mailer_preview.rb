# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def contact_form
    UserMailer.contact_form("john@example.com", "Hector", "Hello World!")
  end

   def order_confirmation
    UserMailer.order_confirmation("john@example.com", 2)
  end
end