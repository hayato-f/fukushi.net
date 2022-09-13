Rails.application.routes.draw do
  root "pages#top"
  get '/signup', to: 'users#new'
  get '/top', to: 'pages_#post'
  get '/post', to: 'pages#post'
  get '/about', to: 'pages#about'
  get '/my_page', to: 'pages#my_page'

  get '/login', to: 'sessions#new'          #restアーキテクチャ　get => new
  post '/login', to: 'sessions#create'      #restアーキテクチャ　post => create
  delete '/logout', to: 'sessions#destroy'   #restアーキテクチャ　delete => destroy
  # ↑手動でリソースを作る場合（ログイン機能は、new,create,destroyしか使わないため、手動で作成した。）

  # ↓自動でリソースを作った場合
  resources :users   #railsのレストフルアーキテクチャが使えるようになる。（url '/users'で参照可能になる）
                      # get => showアクションに対応づけられる。
                      # usersコントローラーのshowアクションにルーティング
                      # つまり、resourcesは、自動でget,post,update,delete...を自動で対応づけを作ってくれる。

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
