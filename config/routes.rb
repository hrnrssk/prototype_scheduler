Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :users, :only => [:show, :edit, :update] do
    get :workings, on: :collection
  end

  root 'prototypes#index'

  resources :prototypes do
    post :confirm, on: :collection
  end

  resources :flows do
    post :confirm, on: :collection
  end

  resources :processings do
    resource :workings, only: [:create, :destroy]
    post :confirm, on: :collection
  end

  resources :equipments do
    post :confirm, on: :collection
  end

  resources :workings, only: [:create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
