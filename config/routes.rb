Rails.application.routes.draw do
  get '/profile', to: 'users#show'
  get '/new', to: 'posts#new'
  devise_for :users
  patch '/avatar', to: 'users#upload_avatar'
  resources :posts do
    resources :comments
  end
  root 'posts#index'
end
