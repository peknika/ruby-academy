Rails.application.routes.draw do
  resources :posts
  get '/profile', to: 'users#show'
  get '/new', to: 'posts#new'
  devise_for :users
  root 'posts#index'
end
