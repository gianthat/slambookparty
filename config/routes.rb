Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:show]

  resources :entries

  resources :pages

  resources :cliques

  resources :slambooks
  
  root to: "home#index"

end
