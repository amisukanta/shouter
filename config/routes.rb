Rails.application.routes.draw do
  root to: 'homes#show', via: :get
  resource :dashboard, only: [:show]
  resources :shouts, only:[:create, :show]
  devise_for :users
  resources :users, only: [:show]
end
