Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cities, only: [:index, :show]
  resources :neighborhoods, only: [:index, :show]
  resources :listings
  resources :users
end
