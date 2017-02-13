FactoryGirl.define do


	FactoryGirl.define do

  	factory :product do
    	name "bike"
    	description  "This is a test bike"
    	colour "yellow"
    	image_url "/image.jpg"
    	price_cents 10000
    end

	end
end