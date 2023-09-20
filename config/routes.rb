Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index' # Replace 'welcome#index' with your desired root path
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/home', to: 'home#index'
  post '/process_location', to: 'weather#process_location'
  get '/show_weather', to: 'weather#show_weather'

  resources :users # in order to use user_path in views file
  # defining users as resource will provide CRUD operations for users object.
end
