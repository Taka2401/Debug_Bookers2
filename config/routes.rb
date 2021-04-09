Rails.application.routes.draw do
  devise_for :users

  root 'homes#top'
  get 'home/about' => 'homes#about'

  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'

  get 'following_user/:id' => 'users#following', as: 'following_user'
  get 'followers_user/:id' => 'users#followers', as: 'followers_user'

  get 'search' => 'search#search', as: 'search'

  resources :users,only: [:show,:index,:edit,:update]

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]

end