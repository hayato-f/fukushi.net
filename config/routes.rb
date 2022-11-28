Rails.application.routes.draw do
  root "pages#top"
  get '/signup', to: 'users#new'
  get '/top', to: 'pages_#post'
  # get '/post', to: 'pages#post'
  get '/about', to: 'pages#about'
  get '/my_page', to: 'pages#my_page'

  # get '/posts', to: "posts#new"
  # post '/posts', to: "posts#create"

  get '/login', to: 'sessions#new'          #restアーキテクチャ　get => new
  post '/login', to: 'sessions#create'      #restアーキテクチャ　post => create
  delete '/logout', to: 'sessions#destroy'   #restアーキテクチャ　delete => destroy
  # ↑手動でリソースを作る場合（ログイン機能は、new,create,destroyしか使わないため、手動で作成した。）

  # ↓自動でリソースを作った場合
  resources :users   #railsのレストフルアーキテクチャが使えるようになる。（url '/users'で参照可能になる）
                      # get => showアクションに対応づけられる。
                      # usersコントローラーのshowアクションにルーティング
                      # つまり、resourcesは、自動でget,post,update,delete...を自動で対応づけを作ってくれる。
  resources :posts do  # => 使える、アクション・httpメソッドの限定。こうする事で、create、destroyアクションに対応したpostとdeleteメソッドが使える。
    # resources :favorites, only: [:create, :destroy]
    post '/favorite', to: 'favorites#create', as: 'create_favorite'
    delete '/favorite', to: 'favorites#destroy', as: 'destroy_favorite'
  end

end
