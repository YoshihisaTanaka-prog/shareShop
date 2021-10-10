Rails.application.routes.draw do
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
