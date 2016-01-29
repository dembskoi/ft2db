Rails.application.routes.draw do
  devise_for :users
  resources :users, :types, :gases
  resources :experiments, :equations, only: [:index, :show, :new, :create, :destroy] do
    member do
      get :download
    end
  end
  resources :results, only: [:index, :show, :new, :create, :destroy] do
    member do
      get :download
    end
    collection do
      get :download_all
    end
  end
  get 'readme' => 'readme#readme'

  root to: 'results#index'
end
