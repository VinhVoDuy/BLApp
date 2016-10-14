Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :home, only: :show do
    get :show2, on: :member
  end
  resource :paypal, only: :show do
    get :success, on: :member
    get :failed, on: :member
  end
end
