Rails.application.routes.draw do
  get "shops" => "shops#index"
  post "shops/create" => "shops#create"
  get "shops/new" => "shops#new"
  get "shops/:id/edit"  => "shops#edit"

  get "categories" => "categories#index"
  post "categories/create" => "categories#create"
  get "categories/new" => "categories#new"
  get "categories/:id/edit" => "categories#edit"
  get "categories/:id" => "categories#show"
  post 'load' => 'tops#load_data'

  
  #devise_for :users
 
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # 大元のページ
  root 'tops#index'
  # 言語選択用のルート
  get 'language', to: 'tops#set_language'

end
