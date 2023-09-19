Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index' # Replace 'welcome#index' with your desired root path
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/home', to: 'home#index'


  resources :users # in order to use user_path in views file
  # defining users as resource will provide CRUD operations for users object.

end