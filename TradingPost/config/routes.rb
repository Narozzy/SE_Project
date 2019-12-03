Rails.application.routes.draw do
  resources :listings
  resources :messages
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'home/index'
  get 'index/index'
  get 'users/index'
  get 'listings/index'
  get 'users/show'
  get 'users/edit'
  resources :home
  resources :users, only: [:index, :show]
  root 'index#index'

  resources :index do
    resources :listings
    resources :users
    resources :messages
  end

  resources :listings do
    resources :home
    resources :users
    end

  resources :messages do 
    resources :users
    resources :listings
  end
end
