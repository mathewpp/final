Rails.application.routes.draw do
  root 'home#index'

  get '/search_users' => 'search#users'

  get '/sessions/new' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/account' => 'users#show'
  
  post '/follow/:id' => 'follow#create'
  get '/followers' => 'follow#followers'
  get '/following' => 'follow#following'
  get '/followers/:id' => 'follow#followers'
  get '/following/:id' => 'follow#following'

  resources :users
  resources :tweets
  resources :messages

end