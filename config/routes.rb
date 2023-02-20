Rails.application.routes.draw do
  resources :groups
  resources :entities
  root to: "users#index"
  resources :users, only: [:new, :show, :index, :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
