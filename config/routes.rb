Rails.application.routes.draw do

  get "/" => "home#index"
  post "users/login", to: "users#login"
  #get "todos/:id" ,to: "todos#show"
  resources :todos
  resources :users
end
