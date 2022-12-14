Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :friendrequests
  root "users#index"
  get "usersfriendrequests", to: "users#pending_friend_request"
  get "/search", to: "users#search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
