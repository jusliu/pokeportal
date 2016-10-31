Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers

  resources :pokemon
  patch 'capture', to:'pokemon#capture'
  patch 'damage', to:'pokemon#damage'
  post '/create', to:'pokemon#create', as: 'create'
  get '/new', to:'pokemon#new', as: 'new'
end
