class Player < ActiveRecord::Base
	attr_accessible :first_name, :last_name, :birthday, :team_id, :address_id

	belongs_to :team, counter_cache: true
	belongs_to :address

	before_create :assign_to_team

	# for our simple little league app, we'll have all the kids play on the same league.
	# In real life, we'd probably be separating them out by age.  But for now, I'll just
	# make sure they're all kids.
	validate :must_be_between_5_and_10
	validates_presence_of :first_name, :last_name, :birthday, :team_id, :address_id
	
	private

	def assign_to_team
		team = self.team || Team.accepting_new.first
		
		if team
			self.team = team
		else
			self.team = team.create
		end
	end

	def must_be_between_5_and_10
		if birthday.present?
			older_than_10 = birthday < 11.years.ago
			younger_than_5 = birthday > 5.years.ago

			if birthday > Date.today
				errors.add(:birthday, "Birthday can't be in the future")
			elsif older_than_10 || younger_than_5
				errors.add(:birthday, "The player must be between 5 and 10 years old")
			end
		end
	end
end