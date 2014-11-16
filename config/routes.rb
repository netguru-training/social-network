Rails.application.routes.draw do
  resources :categories

  resources :groups

  resources :events
  get 'map', to: 'events#map', as: 'map'
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  get 'auth/failure', to: 'sessions#failure', as: 'auth_failure'
  get 'signout', to: 'sessions#destroy', as: 'signout'
  root 'sessions#new'
end
