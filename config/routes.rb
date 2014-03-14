DevBootFace::Application.routes.draw do
  root 'home#index'
  devise_for :users

  resources :users do
  	resources :posts
  end

  resources :posts do
  	resources :comments
  end

  resources :comments do
  	resources :commments
  end
  # get '/posts', to: 'posts#show'

  resources :groups do
    resources :users
  end
  # You can have the root of your site routed with "root"

  end
