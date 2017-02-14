# Preview all emails at http://localhost:3000/rails/mailers/application_mailer
class ApplicationMailerPreview < ActionMailer::Preview

   def new_user
    ApplicationMailer.new_user("email")
  end
end