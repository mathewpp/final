Rails.application.routes.draw do
  root 'home#index'

  get '/search_users' => 'search#users'

  get '/sessions/new' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/account' => 'users#show'

  
  post '/follow/:id' => 'follow#create'
  post '/unfollow/:id' => 'follow#destroy'

  get '/followers' => 'follow#followers'
  get '/following' => 'follow#following'
  get '/followers/:id' => 'follow#followers'
  get '/following/:id' => 'follow#following'

  get '/tweets/reply/:id' => 'tweets#reply'
  post '/tweets/post_reply/:id' => 'tweets#post_reply'

  get 'users/find' => 'users#find'
  post 'users/find' => 'users#find'

  post '/groups/join/:id' => 'groups#join'
  delete '/groups/user/:id' => 'groups#remove_user_from_group'

  resources :users
  resources :tweets
  resources :messages
  resources :groups

end