class HomeController < ApplicationController

	def index
		@recipes = Recipe.all
		@cuisines = Cuisine.all
	end

	def show
		@recipes = Recipe.find( params[:recipe][:id] )
	end
end
