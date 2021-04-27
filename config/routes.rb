Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home#index'

  get "/mi_perfil", to: "home#profile"  , as: "user_profile"
  get "/purchase/:product_id", to: "purchases#create", as: "new_purchase"
  resources :purchases
  resources :evaluations
  resources :messages
  resources :chats
  resources :alerts
  resources :products
  resources :categories
  resources :news
  devise_for :admins
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
