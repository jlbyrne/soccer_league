class Game < ActiveRecord::Base

	attr_accessible :date, :home_team_id, :away_team_id, :home_score, :away_score, :winner, :address

	belongs_to :home_team, :class_name => 'Team', :foreign_key => 'home_team_id'
	belongs_to :away_team, :class_name => 'Team', :foreign_key => 'away_team_id'
	belongs_to :winner, :class_name => 'Team', :foreign_key => 'winner_id'
	belongs_to :address

	validates_presence_of :date, :home_team, :away_team
	validate :cannot_have_same_home_and_away_teams

	before_save :check_for_winner
	before_save :check_for_address

	scope :with_team, ->(team) { where('home_team_id = ? OR away_team_id = ?', team.id, team.id) }

	def tie?
		self.home_score.present && self.away_score.present? && self.home_score == self.away_score
	end

	private
	def cannot_have_same_home_and_away_teams
		if self.home_team.present? && self.away_team.present? && self.home_team_id == self.away_team_id
			errors.add(:home_team_id, "Games must be between two different teams")
		end	
	end

	def check_for_winner
		if self.home_score.present? && self.away_score.present? && self.winner.nil?
			self.winner = self.home_team if self.home_score > self.away_score
			self.winner = self.away_team if self.away_score > self.home_score
		end
	end

	def check_for_address
		if self.address.nil? && self.home_team.home_field.present?
			self.address = self.home_team.home_field
		end
	end
end