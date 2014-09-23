Rails.application.routes.draw do
  root "root#index"
 resources :users do
  resources :rants
 end
  resources :users do
    resources :bios, only: :index
    resources :favorites

  end
  resources :users do
  resources :follows
  end

  get "signin" => "sessions#new"
  post "signin" => "sessions#create"
  get "signout" => "sessions#destroy"
end