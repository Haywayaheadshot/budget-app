Rails.application.routes.draw do
  resources :groups, only: [:new, :show, :index, :create]
  resources :entities
  root to: "users#index"
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
