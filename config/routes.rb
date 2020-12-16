Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root 'prototypes#index'

  resources :prototypes do
    collection do
      post :confirm
    end
  end

  resources :flows do
    collection do
      post :confirm
    end
  end

  resources :processings do
    collection do
      post :confirm
    end
  end

  resources :equipments do
    collection do
      post :confirm
    end
  end

  resources :workings, only: [:create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
