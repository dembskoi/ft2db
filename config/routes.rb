Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :types

  root to: 'types#index'
end
