Rails.application.routes.draw do
   root 'application#welcome'
   get '/signin', to: 'sessions#new'
   post '/signin', to: 'sessions#create'
   get '/signup', to: 'users#new'
   resources :users do 
      resources :goals, only: [:show, :index]
   end
   resources :goals 
   resources :comments
end
