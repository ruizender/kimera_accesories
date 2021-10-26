Rails.application.routes.draw do
  get 'home/index'
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: "home#index"

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resource :shopping_cart, only: [:show, :update, :destroy] do 
    member do
      post :pay_with_paypal
      get :process_paypal_payment 
      end
    end

  resources :products
  resources :categories
  resources :orders

  
end
