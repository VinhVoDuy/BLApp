Rails.application.routes.draw do
require 'sidekiq/web'
  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: 'homes#show'
  post 'set_time', to: 'homes#set_time'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    get 'login', to: 'sessions#new'
    get 'logout', to: 'sessions#logout'
    resources :sessions
    resources :rooms
    resources :room_types
    resources :landing_images do
      get :resize, on: :collection
    end
    resources :tours
    resources :review_images

    resource :main
    resources :contacts, only: :index do
      post :upload, on: :collection
    end

    resource :amenities
    resources :promotions
  end
  resource :home, only: :show do
    get :show2, on: :member
    get :test, on: :member
  end

  resources :rooms, only: [:show, :index]
  resource :paypal, only: :show do
    get :success, on: :member
    get :failed, on: :member
  end

  resources :amenities, only: :index
  resources :availables, only: :create
  resources :tours, only: [:index, :show]
  resources :promotions, only: :show

end
