class ApplicationMailer < ActionMailer::Base
  default from: 'xavier@adkicker.io'
  layout 'mailer'

  def new_user(email)
    @email = email
    render :file => 'application_mailer/new_user.html.erb', :layout => 'mailer'
      mail(:from => 'no_reply@berlinbikeshop.com',
          :to => 'xavier@adkicker.io',
          :subject => "New User: #{email}")
  end

end
