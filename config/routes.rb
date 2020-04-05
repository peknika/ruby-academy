Rails.application.routes.draw do
  resources :posts
  get '/profile', to: 'users#show'
  devise_for :users
  root 'posts#index'
end
