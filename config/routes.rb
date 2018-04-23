Rails.application.routes.draw do

  get 'topics/new'

  get 'sessions/new'

  resources 'users'
  resources 'topics'

  get 'pages/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  post '/favorites', to: 'favorites#create'
  get '/favorites', to: 'favorites#index'

end
