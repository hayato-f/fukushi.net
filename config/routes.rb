Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  get '/top', to: 'pages_#post'
  get '/post', to: 'pages#post'
  get '/about', to: 'pages#about'
  get '/my_page', to: 'pages#my_page'
  root "pages#top"
  resources :users   #railsのレストフルアーキテクチャが使えるようになる。（url /usersで参照可能になる）
                      # get => showアクションに対応づけられる。
                      # usersコントローラーのshowアクションにルーティング？

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
