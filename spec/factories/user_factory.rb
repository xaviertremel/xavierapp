FactoryGirl.define do


	FactoryGirl.define do
		sequence(:email) { |n| "user#{n}@example.com" }

  	factory :user do
    	first_name "John"
    	last_name  "Doe"
    	email
    	password "hotmail"
    	admin false
    end

	  factory :admin, class: User do
		  email
		  password "qwertyuiop"
		  admin true
		  first_name "Admin"
		  last_name "User"
		end

	end
end