Rails.application.routes.draw do

  resources :categories

  resources :groups

  resources :events

  resources :attendances

  get 'map', to: 'events#map', as: 'map'
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  get 'invitations/index', as: 'invitations'
  get 'auth/failure', to: 'sessions#failure', as: 'auth_failure'
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'notifications/index', as: 'notifications'
  get 'profile', to: 'sessions#show', as: 'profile'
  root 'sessions#new'
  match 'search_events', to: 'events#index', via: [:get]
end
