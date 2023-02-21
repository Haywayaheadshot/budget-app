Rails.application.routes.draw do
  devise_for :users
  root to: "groups#index"
  resources :users,only: [:show] do 
    resources :post, only: [:index, :show]
    resources :groups, only: [:new, :show, :index, :create]
    resources :entities
  end
end
