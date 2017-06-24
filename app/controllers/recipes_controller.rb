class RecipesController < ApplicationController

	def show
		@recipe = Recipe.find( params[:id] )
	end

	def new
		@recipe = Recipe.new
		@cuisines = Cuisine.all
		@recipe_type = RecipeType.all
	end


	def create
		@recipe = Recipe.new(recipe_params)

		if params[:recipe][:title].empty?      || params[:recipe][:recipe_type_id].empty? ||
			 params[:recipe][:cook_time].empty?  || params[:recipe][:cuisine_id].empty?  ||
			 params[:recipe][:difficulty].empty? || params[:recipe][:ingredients].empty? ||
			 params[:recipe][:method].empty? then

			 redirect_to new_recipe_path, notice: 'Você deve informar todos os dados da receita'
		else
			@recipe.save
			redirect_to recipe_url(@recipe)
		end
	end


	def bycuisine
		@recipes = Recipe.where(cuisine_id: params[:id])
	end

	def recipe_params
		params.require(:recipe).permit(:title, :recipe_type_id, :cook_time, :cuisine_id, :ingredients, :method, :difficulty)
	end
end
