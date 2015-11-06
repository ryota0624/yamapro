Rails.application.routes.draw do

  root to:'top#index'

  resources :users

  get "signup" => "users#new"

  resource :user_session, only: :create
  get "login" =>"user_sessions#new"
  delete "logout" => "user_sessions#destroy"


  get "get_image" => "essays#get_image"

  resources :essays do #記事
    collection do
      get 'pickup'
      post 'search'
      get "question"
    end
  end

  resources :posts #つぶやき

  # マイページ
  resources :mypages, only: [:index] do
    collection { get "my_essay", "my_list","add_my_list", "my_list_special", "my_post" }
  end

  namespace :api, {format: "json"} do
    get "user" => "apis#user"
    post "adduser" => "apis#add_user"
    post "deleteuser" => "apis#delete_user"
    get "essay" => "apis#essay"
    post "addessay" =>"apis#add_essay"
    post "deleteessay" => "apis#delete_essay"
    post "getimage" => "apis#get_images"
    get "getTags" => "apis#get_tags"
    post "addTag" => "apis#create_tag"
    post "deleteTag" => "apis#delete_tag"
  end
end
