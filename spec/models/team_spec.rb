require 'spec_helper' 

describe Team do 
	it "has a valid factory" do
		FactoryGirl.create(:team).should be_valid
	end

	it "is invalid without a name" do
		FactoryGirl.build(:team, name: nil).should_not be_valid
	end

	it "has a default value of 0 for player count" do
		team = FactoryGirl.build(:team)
		expect(team.players_count).to equal(0)
	end

	it "generates name, mascot, and color on initialization" do
		team = FactoryGirl.build(:generated_team)
		expect(team.name).to be
		expect(team.mascot).to be
		expect(team.color).to be
	end

	it "indicates whether it is full" do
		team = FactoryGirl.build(:team)
		full_team = FactoryGirl.build(:full_team)
		expect(full_team.full?).to be_truthy
		expect(team.full?).to be_falsey
	end

	it "indicates if it is accepting new members" do
		team = FactoryGirl.build(:team)
		full_team = FactoryGirl.build(:full_team)
		expect(team.accepting_new?).to be_truthy
		expect(full_team.accepting_new?).to be_falsey
	end
end