Rails.application.routes.draw do
   get '/', to: 'application#welcome'
   get '/signin', to: 'sessions#new'
   post '/signin', to: 'sessions#create'
   get '/signup', to: 'users#new'
   resources :users
   resources :goals 
   resources :comments
end
