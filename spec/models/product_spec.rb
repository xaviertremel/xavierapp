require 'rails_helper'

describe Product do

	context "when our product has rating" do
		before do
			@product = Product.create!(name: "race bike")
			@user = User.create!(email: "xav84@hotmail.com", password: "hotmail")
			@product.comments.create!(rating: 1, user: @user, body: "Awful bike!")
			@product.comments.create!(rating: 3, user: @user, body: "Great!")
			@product.comments.create!(rating: 5, user: @user, body: "Super!")
		end

		it "should return the average of every comments" do
			expect(@product.average_rating).to eq 3
		end
	end

	context "product is not valid" do
		before do
			@product = Product.new(description: "Nice Bike")
		end

		it "should not be valid" do
			expect(@product).not_to be_valid
		end
	end
end