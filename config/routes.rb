Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: 'homes#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    get 'login', to: 'sessions#new'
    get 'logout', to: 'sessions#logout'
    resources :sessions
    resources :rooms
    resources :room_types
    resources :landing_images
  end
  resource :home, only: :show do
    get :show2, on: :member
  end
  resource :paypal, only: :show do
    get :success, on: :member
    get :failed, on: :member
  end

end
