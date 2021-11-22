Rails.application.routes.draw do

  get "/" => "home#index"
  post "users/login", to: "users#login"
  #get "todos/:id" ,to: "todos#show"
  resources :todos
  resources :users
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create" ,as: :sessions
  delete "/signout" => "sessions#destroy" , as: :destroy_session
end
