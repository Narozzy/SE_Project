Rails.application.routes.draw do
  resources :listings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'home/index'
  get 'index/index'
  resources :home
  root 'home#index'

  
end
