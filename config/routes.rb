Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'pages#homepage' 

  resources :conversions 

  resources :items

  resources :inventories

  resources :purchases

  get 'signup', to: 'users#new'
  resources :users, expect: [:new] 
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
