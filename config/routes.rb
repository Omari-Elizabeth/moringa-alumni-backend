Rails.application.routes.draw do

  resources :announcements

  resources :comments, only:[:index,:show,:create,:update,:destroy]
  resources :posts, only:[:index,:show,:create,:update,:destroy]

  resources :users,only:[:index,:create,:show,:update,:destroy]
  
  resources :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
