Rails.application.routes.draw do
  get 'homes/top'
  devise_for :users

  root to: "homes#top"
  get "home/about"=>"homes#about"

  resources :posts, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :users, only: [:index,:show,:edit,:update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
