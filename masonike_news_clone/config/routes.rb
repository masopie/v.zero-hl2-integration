Rails.application.routes.draw do

  root to: 'posts#index'

  # resources :posts
  get '/posts' => 'posts#index'
  # get '/posts/new' => 'posts#new'
  post '/posts' => 'posts#create'
  get '/posts/:id' => 'posts#show', :as => :post
  get '/posts/:id/edit' => 'posts#edit'
  get '/posts/:id/vote' => 'posts#vote', :as => :vote
  put '/posts/:id' => 'posts#update'
  delete '/posts/:id' => 'posts#destroy'


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post 'users' => 'users#create'

  resources :users

end
