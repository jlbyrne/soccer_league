require 'faker'

FactoryGirl.define do 
	factory :team do |f| 
		f.name "Army of Racoons"
		f.mascot "Coach Z"
		f.color "Celery"
		f.home_field { FactoryGirl.create(:address) }
	end 

	factory :generated_team, :class => Team do |f|
		f.home_field { FactoryGirl.create(:address) }
	end

	factory :full_team, :class => Team do |f|
		f.name "Army of Racoons"
		f.mascot "Coach Z"
		f.color "Celery"
		f.home_field { FactoryGirl.create(:address) }
		f.players_count 20
	end
end