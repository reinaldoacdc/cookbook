class RecipeTypesController < ApplicationController

  def show
    @recipes = Recipe.where( recipe_type_id: params[:id] )
    @recipe_type = RecipeType.find( params[:id] )
  end

  def new
    @recipe_type = RecipeType.new
  end

  def create
    #if current_user.admin? &&
      @recipe_type = RecipeType.new
      if params[:recipe_type][:name].empty?
        redirect_to new_recipe_type_path, notice: 'Você deve informar o nome do tipo de receita'
  		else
  			@recipe_type.name = params[:recipe_type][:name]
  			@recipe_type.save
  			redirect_to recipe_type_url(@recipe_type)
  		end
    #else
    #  redirect_to new_recipe_type_path, notice: 'Você deve ser ADMIN'
    #end
  end

end
