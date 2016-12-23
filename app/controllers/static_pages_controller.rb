class StaticPagesController < ApplicationController
  def index
  end

  def landing_page
    @featured_product = Product.first
    @products = Product.take(4)
  end

end
