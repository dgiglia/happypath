Rails.application.routes.draw do
  root to: 'welcome#index'
  
  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  
  
  resources :footsteps do
    resources :comments, only: [:create]
    member do
      post 'copy'
    end
  end
  
  resources :categories, only: [:create, :new, :show]
  
  resources :users, only: [:create, :show, :edit, :update]
end
