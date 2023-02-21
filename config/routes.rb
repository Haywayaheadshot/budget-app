Rails.application.routes.draw do
  devise_for :users
  resources :groups, only: [:new, :show, :index, :create]
  resources :entities
  root to: "groups#index"
  resources :users, only: [:new, :index]
end
