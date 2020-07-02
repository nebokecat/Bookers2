Rails.application.routes.draw do
  
  root 'home#index'
  devise_for :users
  get 'home/index'
  get 'home/about'
  resources :users,only: [:index,:show,:edit,:update]
  resources :books,only: [:index,:create,:show,:update,:edit,:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
