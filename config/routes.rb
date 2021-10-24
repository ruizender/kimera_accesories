Rails.application.routes.draw do
  get 'home/index'
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: "home#index"

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :products
  resources :categories
  resources :orders
  resources :shopping_carts, only: [:show, :update, :destroy]
  
end
