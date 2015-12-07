Rails.application.routes.draw do

  root to:'top#index'

  resources :users do
    collection { get "image", "complete"}
  end
  get "signup" => "users#new"

  resource :user_session, only: :create
  get "login" =>"user_sessions#new"
  delete "logout" => "user_sessions#destroy"
  get "logout" => "user_sessions#destroy"


  get "about" => "top#about"
  get "get_image" => "essays#get_image"

  resources :essays do #記事
    collection do
      get 'pickup'
      post 'search'
      get "question"
    end
  end

  post "comment" => "comments#create"

  resources :posts #つぶやき

  # マイページ
  resources :mypages, only: [:index] do
    collection { get "my_essay", "my_list","add_my_list", "my_post", "destroy_my_list","get_user_image" }
  end

  namespace :api, {format: "json"} do
    get "user" => "apis#user"
    post "adduser" => "apis#add_user"
    post "deleteuser" => "apis#delete_user"
    get "essay" => "apis#essay"
    post "addessay" =>"apis#add_essay"
    post "deleteessay" => "apis#delete_essay"
    post "getimage" => "apis#get_images"
    get "tags" => "apis#get_tags"
    post "addTag" => "apis#create_tag"
    post "deleteTag" => "apis#delete_tag"
  end
end
