FactoryGirl.define do

	factory :comment do
  	user_id 1
  	product_id 1
  	title "this is comment title"
  	body "this is comment body"
  	rating 4
  end

end