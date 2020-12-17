Rails.application.routes.draw do
  root to: 'homes#top'
  get 'homes/top'
  get 'homes/about'
  devise_for :users
  resources :users, only: [:show, :index, :edit, :update, :destroy] do
    member do
      get 'quit'
    end
  end
  resources :shops do
    resources :reviews do
      resource :favorites, only: [:create, :destroy]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end