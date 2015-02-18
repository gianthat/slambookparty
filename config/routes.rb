Rails.application.routes.draw do

  devise_for :users

  resources :users do
  	member do 
  		get "homeroom"
  	end
  end

  resources :entries

  resources :pages

  resources :cliques

  resources :slambooks
  
  root to: "home#index"

end
