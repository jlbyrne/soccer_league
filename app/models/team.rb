class Team < ActiveRecord::Base
	MAX_PLAYERS_PER_TEAM = 20

	NAME_ADJECTIVES = ["Army of", "Shaolin", "Awesome", "Raging", "Zulu", "Venomous", "Cyborg", "Kicking", "Prancing", "Violet"]
	NAME_NOUNS = ["Racoons", "Darkness", "Tanks", "Raiders", "Tigers", "Hurricanes", "Cyborgs", "Mavericks", "United", "Grumpy Cats"]
	MASCOTS = ["The Cheat", "Strong Bad", "Dumple", "Strong Sad", "HomeStar Runner", "Trogdor", "Pom Pom", "King of Town", "Strong Mad", "Coach Z"]
	COLORS = ["Olive", "Pistachio", "Shamrock", "Viridian", "Lime", "Mint", "Chartreuse", "Forest", "Celery", "Hunter"]

	attr_accessible :name, :mascot, :color, :address_id, :players_count

	belongs_to :home_field, :class_name => 'Address', :foreign_key => 'address_id'
	has_many :players

	validates_presence_of :name, :players_count

	after_initialize :build_attributes
	# If I were really building out this app, here I would want a notification to be sent
	# to some sort of admin letting them know a new team had been created and needed to 
	# be assigned a field.  But as the great Alton Brown would say, that's another show.

	# In a real life situation, I would also probably check to make sure there aren't too
	# few players either.  For now, we'll just check for the max.
	scope :full, -> { where('teams.players_count >= ?', MAX_PLAYERS_PER_TEAM)} 
	scope :accepting_new, -> { where('teams.players_count < ?', MAX_PLAYERS_PER_TEAM)}

	def full?
		self.players_count >= MAX_PLAYERS_PER_TEAM
	end

	def accepting_new?
		self.players_count < MAX_PLAYERS_PER_TEAM
	end

	private
	def build_attributes
		self.name ||= NAME_ADJECTIVES.sample + " " + NAME_NOUNS.sample
		self.mascot ||= MASCOTS.sample
		self.color ||= COLORS.sample
	end
end