class RecipesController < ApplicationController

	def show
		@recipe = Recipe.find( params[:id] )
	end

	def new
		@recipe = Recipe.new
		@cuisines = Cuisine.all
	end


	def create
		@recipe = Recipe.new(recipe_params)
		@recipe.save
		redirect_to recipe_url(@recipe)
	end


	def bycuisine
		@recipes = Recipe.where(cuisine_id: params[:id])
		#@recipe = Recipe.all.first
	end

	def recipe_params
		params.require(:recipe).permit(:title, :recipe_type, :cook_time, :cuisine_id, :ingredients, :method, :difficulty)
	end
end
