Rails.application.routes.draw do
  resources :listings
  resources :users
  resources :welcome
  
  get 'users/index'
  root 'users#index'
end
