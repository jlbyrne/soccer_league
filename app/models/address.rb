class Address < ActiveRecord::Base
	attr_accessible :street_1, :street_2, :city, :state, :zip
	
	validates_presence_of :street_1, :city, :state, :zip
	
	# I'm putting in user-friendly error messages because I'm lazy and like to 
	# just display the model errors when a user makes a mistake on a form.
	
	# I'm not enforcing 5 digits or numbers here because addresses might be Canadian
	validates :zip, length: { 
		in: 5..10,
		too_long: "Zip codes may not be more than 10 characters",
		too_short: "Zip codes must be at least 5 characters" 
	}
	
	validates :state, length: { 
		is: 2,
		wrong_length: "Please use the 2 character abbreviation for your state or province." 
	}
end