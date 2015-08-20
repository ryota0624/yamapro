Rails.application.routes.draw do
	
  root to:'top#index'
  
  resources :users
  get "signup" => "users#new"

  resource :user_session, only: :create
  get "login" =>"user_sessions#new"
  delete "logout" => "user_sessions#destroy"

  
  resource :essays #仮ビュー用
  resource :posts #仮ビュー用
end
