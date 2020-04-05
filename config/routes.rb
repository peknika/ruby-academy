Rails.application.routes.draw do
  resources :posts
  get '/profile', to: 'users#show'
  get '/new', to: 'posts#new'
  devise_for :users
  patch '/avatar', to: 'users#upload_avatar'

  root 'posts#index'
end
