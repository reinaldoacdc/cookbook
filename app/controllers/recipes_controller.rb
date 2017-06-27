class RecipesController < ApplicationController

	def show
		@recipe = Recipe.find( params[:id] )
	end

	def new
		@recipe = Recipe.new
		@cuisines = Cuisine.all
		@recipe_type = RecipeType.all
	end

	def edit
		@recipe = Recipe.find( params[:id] )
		@recipe_type = RecipeType.all
		@cuisines = Cuisine.all
	end

	def update
		@recipe = Recipe.find( params[:id] )
		if @recipe.update( recipe_params ) then			
			redirect_to recipe_url(@recipe)
		else
			redirect_to edit_recipe_url(@recipe), notice: 'Você deve informar todos os dados da receita'
		end
	end

	def create
		@recipe = Recipe.new(recipe_params)

		if @recipe.valid?
			@recipe.save
			redirect_to recipe_url(@recipe)
		else
			redirect_to new_recipe_path, notice: 'Você deve informar todos os dados da receita'
		end
	end


	def bycuisine
		@recipes = Recipe.where(cuisine_id: params[:id])
	end

	def recipe_params
		params.require(:recipe).permit(:title, :recipe_type_id, :cook_time, :cuisine_id, :ingredients, :method, :difficulty)
	end
end
