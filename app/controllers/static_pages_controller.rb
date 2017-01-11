class StaticPagesController < ApplicationController
  def index
  end

  def landing_page
    @featured_product = Product.first
    @products = Product.take(4)
  end

  def thank_you
  	@name = params[:name]
  	@email = params[:email]
  	@message = params[:message]
  	ActionMailer::Base.mail(:from => @email,
      :to => 'xavier@adkicker.io',
      :subject => "A new contact form message from #{@name}",
      :body => @message).deliver_now
  end
end
