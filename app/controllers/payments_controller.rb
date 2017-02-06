class PaymentsController < ApplicationController

	def create
		@product = Product.find(params[:product_id])
		@user = current_user
	  token = params[:stripeToken]
	  # Create the charge on Stripe's servers - this will charge the user's card
	  begin
	    charge = Stripe::Charge.create(
	      :amount => @product.price, # amount in cents, again
	      :currency => "eur",
	      :source => token,
	      :description => params[:stripeEmail]
	    )
	    if charge.paid
  			Order.create(user_id: @user.id, product_id: @product.id, total: @product.price.to_f/100)
  			UserMailer.order_confirmation(params[:stripeEmail], @user.first_name, @product.name, @product.price.to_f/100).deliver_now
  			flash[:notice] = "Thanks for your order "+@user.first_name.titleize+"!"
			end
	  	rescue Stripe::CardError => e
	    # The card has been declined
	    body = e.json_body
    	err = body[:error]
    	flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
	  end
		redirect_to product_path(@product)

	end
end
