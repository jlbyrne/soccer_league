require 'faker'

FactoryGirl.define do 
	factory :address do |f| 
		f.street_1 { Faker::Address.street_address}
		f.street_2 { Faker::Address.secondary_address}
		f.city { Faker::Address.city}
		f.state { Faker::Address.state_abbr}
		f.zip { Faker::Address.postcode}
	end 
end