Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root to: 'home#index'
	#get 'recipesbycuisine/:id', to: 'recipes#bycuisine'
	#get 'recipesbyname/:title', to: 'recipes#search', as: 'search_recipes'
	resources :recipes, only: [:index, :show, :new, :create, :edit, :patch, :update] do
		get 'search', on: :collection
	end
	resources :cuisines
	resources :recipe_types
end
