Rails.application.routes.draw do
  root "root#index"
  get "spam/:id" => "spam#create", as: :spam
 resources :users do
  resources :rants
 end
  resources :users do
    resources :bios, only: :index
    resources :favorites
    resources :comments, only: :create, module: "users"
    resources :follows

  end
  resources :searches, only: :index

  resources :rants do
    resources :comments, only: :create, module: "rants"

  end

  resources :admin


  get "signin" => "sessions#new"
  post "signin" => "sessions#create"
  get "signout" => "sessions#destroy"

  get "/confirm_email/:confirmation_token", to: "email_confirmers#destroy", as: "email_confirmation"
  get "/login_impersonator", to: "admin_sessions#new", as: "login_impersonator"



end