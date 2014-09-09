Rails.application.routes.draw do
  root "root#index"
 resources :users do
  resources :rants
  end

  get "signin" => "sessions#new"
  post "signin" => "sessions#create"
  get "signout" => "sessions#destroy"
end