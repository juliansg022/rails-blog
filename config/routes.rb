# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'home#index'

  resources :articles do
    resources :comments
  end

  resources :users do
    get '/my_articles', to: 'users#my_articles'
    get '/my_profile', to: 'users#show'
    # get '/published_articles', to: 'users#published_articles'

    member do
      get :follow
      get :unfollow
      get :followers
      get :following
      get :published_articles
    end
  end
end
