Rails.application.routes.draw do
  get 'messages/new'
  get 'messages/update'
  get 'new/update'
  devise_for :users
  get 'dashboard', to: "pages#dashboard"
  root to: 'reports#index'
  resources :reports, only: %i[create new index destroy] do
    member do
      post :vote_up
    end
  end
    resources :events, only: %i[index show] do
      resources :attendances, only: %i[create]
      resources :chat_room, only: [] do
        resources :messages, only: [:create]
      end
    end
  resources :attendances, only: %i[destroy]



  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
