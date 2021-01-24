Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  # devise_for :users do
  #   root "users/registrations#new"
  # end

  resources :users, :only => [:new, :create, :show, :edit, :update, :destroy] do
    get :workings, on: :collection
  end

  devise_scope :user do
    root :to => 'users/registrations#new'
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  # root to: 'prototypes#index'
  # root 'users/registrations#new'


  resources :prototypes do
    post :confirm, on: :collection
    resources :flows do
      post :confirm, on: :collection
    end
  end

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
