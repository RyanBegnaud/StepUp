Rails.application.routes.draw do
   root 'application#welcome'
   get '/signin', to: 'sessions#new'
   post '/signin', to: 'sessions#create'
   get '/signup', to: 'users#new'
   get '/auth/facebook/callback' => 'sessions#create'
   match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
   get 'logout', to: 'sessions#destroy'

   resources :goals
   resources :comments

   resources :users do 
      resources :goals, only: [:show, :index]
   end
   resources :goals do 
      resources :comments, only: [:show, :new, :index, :create]
   end
end
