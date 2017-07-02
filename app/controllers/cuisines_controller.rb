class CuisinesController < ApplicationController

	def show
		@recipes = Recipe.where(cuisine_id: params[:id])
		@cuisine = Cuisine.find( params[:id] )
	end

	def new
		@cuisine = Cuisine.new
	end


	def create
		@cuisine = Cuisine.new

		if params[:cuisine][:name].empty?
			redirect_to new_cuisine_path, notice: 'Você deve informar o nome da cozinha'
		else
			@cuisine.name = params[:cuisine][:name]
			@cuisine.save
			redirect_to cuisine_url(@cuisine)
		end
	end

	def index
		@cuisines = Cuisine.all
	end

	def edit
		@cuisine = Cuisine.find( params[:id] )
	end

	def update
		@cuisine = Cuisine.find( params[:id] )
		@cuisine.update( params.require(:cuisine).permit(:name) )
		redirect_to cuisines_path
	end

end
