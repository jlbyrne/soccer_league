# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

addresses = [{ street_1: "196 Woodside Circle", city: "Mobile", state: "FL", zip: "36602" },
			 { street_1: "3756 Preston Street", city: "Wichita", state: "KS", zip: "67213" },
			 { street_1: "1635 Franklin Street", city: "Montgomery", state: "AL", zip: "36104" },
			 { street_1: "2595 Pearlman Avenue", city: "Sudbury", state: "MA", zip: "01776" }, 
			 { street_1: "508 Virginia Street", city: "Chicago", state: "IL", zip: "60653" },
			 { street_1: "1516 Holt Street", city: "West Palm Beach", state: "FL", zip: "33401" }]

addresses.each do |address|
	Address.create(address)
end

team_1 = Team.create(address_id: Address.first.id)
team_2 = Team.create(address_id: Address.second.id)

players = [{ first_name: "Chocolate", last_name: "Columbo", birthday: 6.years.ago, address_id: Address.first.id, team_id: team_1.id},
		  { first_name: "Felicia", last_name: "Fancybottom", birthday: 7.years.ago, address_id: Address.second.id, team_id: team_1.id},
		  { first_name: "Ovaltine", last_name: "Jenkins", birthday: 8.years.ago, address_id: Address.third.id, team_id: team_1.id},
		  { first_name: "Galileo", last_name: "Humpkins", birthday: 9.years.ago, address_id: Address.fourth.id, team_id: team_2.id},
		  { first_name: "Lavender", last_name: "Gooms", birthday: 10.years.ago, address_id: Address.fifth.id, team_id: team_2.id},
		  { first_name: "Methuselah", last_name: "Honeysuckle", birthday: 6.years.ago, address_id: Address.last.id, team_id: team_2.id}]

players.each do |player|
	Player.create!(player)
end

Game.create!(date: Date.today, home_team_id: team_1.id, away_team_id: team_2.id, home_score: 4, away_score: 3)
Game.create!(date: Date.today, home_team_id: team_1.id, away_team_id: team_2.id, home_score: 2, away_score: 3)
Game.create!(date: Date.today, home_team_id: team_1.id, away_team_id: team_2.id, home_score: 4, away_score: 4)