require 'spec_helper' 

describe Address do 
	it "has a valid factory" do
		FactoryGirl.create(:address).should be_valid
	end

	it "is invalid without a street_1" do
		FactoryGirl.build(:address, street_1: nil).should_not be_valid
	end

	it "is invalid without a city" do
		FactoryGirl.build(:address, city: nil).should_not be_valid
	end

	it "is invalid without a state" do
		FactoryGirl.build(:address, state: nil).should_not be_valid
	end

	it "is invalid without a zip" do
		FactoryGirl.build(:address, zip: nil).should_not be_valid
	end

	it "only allows two characters for the state" do
		FactoryGirl.build(:address, state: "WDC").should_not be_valid
	end

	it "requires at least 5 characters for the zip" do
		FactoryGirl.build(:address, zip: "1234").should_not be_valid
	end

	it "does not allow more than 10 characters for the zip" do
		FactoryGirl.build(:address, zip: "12345-12345").should_not be_valid
	end
end