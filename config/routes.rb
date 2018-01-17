Rails.application.routes.draw do
  # root 'pages#show', page: 'home'
  root 'appointments#index'
  resources :appointments
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end