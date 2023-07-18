Rails.application.routes.draw do
  resources :posts, only: [:index, :show]
  resources :users, only: [:index, :show]
  resources :comments, only: [:index, :show]
  resources :likes, only: [:index, :show]
end
