Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "products#index"
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :products
  resources :categories
  resources :orders
  resources :shopping_carts, only: [:show, :update, :destroy]
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
