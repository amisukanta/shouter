Rails.application.routes.draw do
  root to: 'homes#show', via: :get
  devise_for :users
end
