Rails.application.routes.draw do
  resources :categories

  resources :groups

  resources :events

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  get 'signout', to: 'sessions#destroy', as: 'signout'
  root 'sessions#new'

end
