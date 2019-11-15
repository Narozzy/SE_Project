Rails.application.routes.draw do
  resources :listings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'home/index'
  get 'index/index'
  get 'users/index'
  get 'listings/index'
  resources :home
  resources :users
  root 'index#index'

  resources :index do
    resources :listings
  end

  resources :listings do
    resources :home
    resources :users
  end
end
