class WelcomeController < ApplicationController

	layout 'application'
	def index
		@games = Game.all

		respond_to do |format|
			format.html
			format.json { render json: @games }
		end
	end
end