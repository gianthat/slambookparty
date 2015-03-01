Rails.application.routes.draw do

  devise_for :users, controllers: { :registrations => "registrations" }

  resources :users do
  	member do 
  		get "homeroom"
  	end
  end

  resources :entries

  resources :pages

  resources :cliques do
    member do
      get "join"
      post "join_clique"
      post "leave_clique"
    end
  end

  resources :slambooks

  authenticated :user do
    root to: "users#homeroom", as: :user_root
  end
  
  root to: "home#index"

end
