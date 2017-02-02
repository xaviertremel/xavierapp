class OrdersController < ApplicationController
  before_action :authenticate_user!

	def index
  end

  def show
  end

  def new
  end

  def create
    @email = current_user.email
    @product_id = params[:product_id]
    UserMailer.order_confirmation(@email, @product_id).deliver_now
  end

  def destroy
  end

end