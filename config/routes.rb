FlatironKitchen::Application.routes.draw do

  resources :recipes, :ingredients, only: [:index, :show, :new, :create, :edit, :update]

end
