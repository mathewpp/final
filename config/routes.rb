Rails.application.routes.draw do
  root 'home#index'

  get '/search_users' => 'search#users'

  resources :user
  resources :tweets

end