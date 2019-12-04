Rails.application.routes.draw do
  devise_for :users
  get 'dashboard', to: "pages#dashboard"
  root to: 'reports#index'
  resources :reports, only: %i[create new index destroy] do
    member do
      post :vote_up
    end
    resources :events, only: %i[index show] do
      resources :attendances, only: %i[create]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
