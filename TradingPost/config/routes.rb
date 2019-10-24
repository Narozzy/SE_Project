Rails.application.routes.draw do
  resources :listings
  resources :users
  
  get 'users/index'
  root 'users#index'
end
