Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root to: 'home#index'
	get 'recipesbycuisine/:id', to: 'recipes#bycuisine'
	resources :recipes
	resources :cuisines
end