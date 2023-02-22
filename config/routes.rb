Rails.application.routes.draw do
  resources :group_entities
  devise_for :users
  root to: "groups#index"

  resources :groups, only: [:new, :show, :index] do 
    resources :entities, only: [:index]
  end
end
