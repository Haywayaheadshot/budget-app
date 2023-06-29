Rails.application.routes.draw do
  # resources :group_entities

    devise_for :users
    devise_scope :user do
      authenticated :user do
        root 'groups#index', as: :authenticated_root
      end
      
      unauthenticated :user do
        root 'devise/sessions#welcome', as: :unauthenticated_root
      end
    end
  


  resources :groups, only: [:new, :index] do 
    resources :entities, only: [:create, :new]
  end
  get  '/groups/:group_id/entities', to: 'entities#index', as: 'groups_entities'
  post '/groups/', to: 'groups#create', as: 'create_group'
  
end
