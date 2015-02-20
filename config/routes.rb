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
    collection do
        post "join_clique"
    end
  end

  # post "join_clique", to: "cliques#join_clique", as: 'join_clique', via: [:post]


  resources :slambooks
  
  root to: "home#index"

end
