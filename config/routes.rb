Rails.application.routes.draw do
	
  root to:'top#index'
  
  resources :users
  get "signup" => "users#new"

  resource :user_session, only: :create
  get "login" =>"user_sessions#new"
  delete "logout" => "user_sessions#destroy"


  resources :essays do #記事
    collection do
      get 'pickup'
    end
  end

  resources :posts #つぶやき
  resources :favs
  resources :mypages #マイページ

end
