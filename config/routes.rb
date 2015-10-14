Rails.application.routes.draw do

  root to:'top#index'

  resources :users do
    member {get "editpass"}
  end

  get "signup" => "users#new"

  resource :user_session, only: :create
  get "login" =>"user_sessions#new"
  delete "logout" => "user_sessions#destroy"

  resources :essays do #記事
    collection do
      get 'pickup'
      post 'search'
    end
  end

  resources :posts #つぶやき

  # マイページ
  resources :mypages, only: [:index] do
    collection { get "my_essay", "my_list", "my_fav", "my_post" }
  end
end
