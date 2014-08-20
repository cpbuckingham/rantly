Rails.application.routes.draw do
  root "root#index"
  resources :registrations, only: [:new, :create]
  resource :sessions, only: [:new, :create, :destroy]

  get "signin" => "sessions#new"
  post "signin" => "sessions#create"
  get "signout" => "sessions#destroy"
end