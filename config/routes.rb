Rails.application.routes.draw do
  root "users#index"

  resources :users, only: [:show, :index] do
    resources :posts, only: [:show, :index, :new, :create] do
      resources :commets, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end
end
