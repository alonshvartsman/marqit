Rails.application.routes.draw do
  devise_for :users
  get 'dashboard', to: "pages#dashboard"
  root to: 'reports#index'
  resources :reports, only: %i[create new index destroy]
  resources :events, only: %i[index show] do
    resources :attendances, only: %i[create]
  end
end
