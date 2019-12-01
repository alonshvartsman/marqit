Rails.application.routes.draw do

  get 'events/index'
  get 'events/show'
  devise_for :users
  root to: 'reports#index'
  resources :reports, only: %i[create new index destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
