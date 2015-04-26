Rails.application.routes.draw do
  root to: 'homes#show', via: :get
  resource :dashboard, only: [:show]
  resources :shouts, only:[:show]
  resources :text_shouts, only:[:create]
  resources :photo_shouts, only:[:create]
  devise_for :users
  resources :users, only: [:show]
end
