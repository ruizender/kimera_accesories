Rails.application.routes.draw do
  get 'home/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  root to: "home#index"
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  
  resources :shopping_carts, only: [:show, :update, :destroy] do 
    member do
      post :pay_with_paypal
      get :process_paypal_payment 
    end
  end
  
  resources :payment
  resources :orders
  resources :products
  resources :categories
  post '/rate' => 'rater#create', :as => 'rate'
  
  
end
