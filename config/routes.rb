Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home#index'

  get "/mi_perfil", to: "home#profile"  , as: "user_profile"

  resources :evaluations
  resources :messages
  resources :chats
  resources :sales
  resources :alerts
  resources :products
  resources :categories
  resources :news
  devise_for :admins
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
