Rails.application.routes.draw do
  devise_for :users
  root to:'items#index'

  # Defines the root path route ("/")
  # root "articles#index"
end
