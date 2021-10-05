Rails.application.routes.draw do
<<<<<<< HEAD
  resources :products
  resources :categories
  devise_for :users
=======
  resources :shopping_carts
  resources :orders
>>>>>>> development
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "products#index"
end
