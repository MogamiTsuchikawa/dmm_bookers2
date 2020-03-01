Rails.application.routes.draw do
  get 'root/index'
  root to: 'root#index'
  devise_for :users
  resources :books, only: [ :create, :index, :show]
  resources :users, only: [:show,:edit,:update,:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
