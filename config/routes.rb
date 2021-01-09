Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :users, :only => [:new, :create, :show, :edit, :update, :destroy] do
    get :workings, on: :collection
  end

  root 'prototypes#index'

  resources :prototypes do
    post :confirm, on: :collection
    resources :flows do
      post :confirm, on: :collection
    end
  end

  # resources :flows do
  #   post :confirm, on: :collection
  # end

  resources :processings do
    resource :workings, only: [:create, :destroy]
    post :confirm, on: :collection
    collection do
      get 'get_equipment_schedule' # /processings/get_equipment_schedule
      get 'get_user_schedule' # /processings/get_user_schedule
    end
  end

  resources :equipments do
    post :confirm, on: :collection
  end

  resources :workings, only: [:new, :create, :destroy] do
    collection do
      get 'get_users' # /workings/get_users
    end
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
