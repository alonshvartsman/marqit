Rails.application.routes.draw do
  devise_for :users
  get 'dashboard', to: "pages#dashboard"
  get 'help', to: "pages#help"
  root to: 'reports#index'
  resources :reports, only: %i[create new index destroy] do
    member do
      post :vote_up
    end
  end
    resources :events, only: %i[index show] do
      resources :attendances, only: %i[create]
    end
    resources :chat_room, only: [] do
      resources :messages, only: [:create]
    end


  resources :attendances, only: %i[destroy]



  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
