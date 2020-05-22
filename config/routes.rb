Rails.application.routes.draw do
  get '/profile/:id', to: 'users#show', as: :profile
  devise_for :users
  patch '/avatar', to: 'users#upload_avatar'
  resources :posts do
    resources :comments, only: [:create, :index, :destroy]
    resource :likes
  end
  resources :feed, only: [:index]
  resources :relationships, only: [:create, :destroy]
  root 'posts#index'
end
