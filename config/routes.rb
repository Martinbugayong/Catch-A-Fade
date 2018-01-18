Rails.application.routes.draw do
  # root 'pages#show', page: 'home'
  root 'sessions#create', page: 'home'
  # get '/', to: 'appointments#index', as: :appointments
  get '/login', to: 'sessions#new'
  resources :appointments
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end