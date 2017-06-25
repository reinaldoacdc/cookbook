class RecipeTypeController < ApplicationController

  def show
    @recipes = Recipe.where( recipe_type_id: params[:id] )
    @recipe_type = RecipeType.find( params[:id] )
  end


end
