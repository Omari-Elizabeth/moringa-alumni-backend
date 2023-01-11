Rails.application.routes.draw do

  resources :profiles,only:[:index,:create,:show,:update,:destroy]

  post "/login-user",to: "user_login#create"
  post "/login",to: "admin_sessions#create"
  
  resources :announcements

  resources :comments, only:[:index,:show,:create,:update,:destroy]
  resources :posts, only:[:index, :show, :create, :update, :destroy]

  resources :users,only:[:index,:create,:show,:update,:destroy]
  
  resources :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


end
