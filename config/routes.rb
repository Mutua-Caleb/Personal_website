# == Route Map
#

Rails.application.routes.draw do
  resources :projects do 
    resources :comments
  end
  resources :posts
  devise_for :users 
  get 'home/index'
  root 'home#index'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
