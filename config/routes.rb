Rails.application.routes.draw do
   get '/', to: 'application#welcome'
   get '/signin', to: 'sessions#new'
   resources :users
end
