Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :types
  resources :experiments, only: [:index, :show, :new, :create, :destroy] do
    member do
      get :download
    end
  end

  root to: 'types#index'
end
