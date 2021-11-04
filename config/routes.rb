# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'home#index'

  resources :articles do
    resources :comments
  end

  resources :users do
    get '/my_articles', to: 'articles#my_articles'
  end


end
