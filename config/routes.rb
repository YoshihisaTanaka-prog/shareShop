Rails.application.routes.draw do
  get "shops" => "shops#index"
  post "shops/create" => "shops#create"
  get "shops/new" => "shops#new" 
  #devise_for :users
 
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'tops#index'


end
