Rails.application.routes.draw do
  root "root#index"
 resources :users do
  resources :rants
 end
  resources :users do
    resources :bios, only: :index
    resources :favorites

  end
  resources :searches, only: :index

  resources :users do
  resources :follows
  end
  resources :rants do
    resources :comments, only: :create
  end
  resources :users do
    resources :comments, only: :create
  end

  get "signin" => "sessions#new"
  post "signin" => "sessions#create"
  get "signout" => "sessions#destroy"

  get "/confirm_email/:confirmation_token", to: "email_confirmers#destroy", as: "email_confirmation"
  get "/login_impersonator", to: "admin_sessions#new", as: "login_impersonator"

end