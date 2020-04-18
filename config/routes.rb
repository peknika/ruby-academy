Rails.application.routes.draw do
  get '/profile/:id', to: 'users#show', as: :profile
  get '/new', to: 'posts#new'
  devise_for :users
  patch '/avatar', to: 'users#upload_avatar'
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
  root 'posts#index'
end
