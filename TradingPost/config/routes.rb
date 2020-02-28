Rails.application.routes.draw do
  # resource  :session, :controller => 'sessions', :only => [:new, :create, :destroy]
  resources :listings
  resources :messages
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'home/index'
  get 'index/index'
  get 'users/index'
  get 'listings/index'
  get 'users/new'
  get 'users/show'
  get 'users/edit'
  # match '/sign_out' => 'sessions#destroy', :via => :delete 
  resources :home
  resources :users, controller: 'users', only: Clearance.configuration.user_actions
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
