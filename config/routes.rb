Rails.application.routes.draw do
  devise_for :users
  root to:'items#index'
  resources :items, only: [:new, :create]
  # Defines the root path route ("/")
  # root "articles#index"
end
