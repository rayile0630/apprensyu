Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'users/new'
  get 'users/create'
  root to: 'tasks#index'
  
  get 'signup', to: 'users#new'
  resources :tasks, except: [:index]
  resources :users, only: [:new, :create]
end
