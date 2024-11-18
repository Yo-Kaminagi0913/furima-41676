Rails.application.routes.draw do
  devise_for :users
  root to:'items#index'
  resources :items
  # Defines the root path route ("/")
  # root "articles#index"
end
