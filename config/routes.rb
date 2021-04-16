Rails.application.routes.draw do
  resources :evaluations
  resources :messages
  resources :chats
  resources :transactions
  resources :alerts
  resources :products
  resources :categories
  resources :news
  devise_for :admins
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get 'home/index'
  root 'home#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
