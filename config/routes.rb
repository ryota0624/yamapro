Rails.application.routes.draw do
  root to:"top#index"
  resources :users
  get "signup" => "users#new"

end
