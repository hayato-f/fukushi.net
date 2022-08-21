Rails.application.routes.draw do
  root "pages_top#top"
  get 'pages_top/post'
  get 'pages_top/my_page'
  get 'pages_top/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
