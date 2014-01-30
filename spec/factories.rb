FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
    email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
  end

	factory :value_inquiry do
		karat	"22"
		weight	"2"
		market_price	"36.94"
		value 	"73.88"
		user
	end
end