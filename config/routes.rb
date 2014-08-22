Rails.application.routes.draw do
  root "root#index"
  resources :registrations, only: [:new, :create, :edit, :update]
  resource :sessions, only: [:new, :create, :destroy]
  resources :rant, only: [:index, :new, :create, :edit, :update, :destroy]

  get "signin" => "sessions#new"
  post "signin" => "sessions#create"
  get "signout" => "sessions#destroy"
end