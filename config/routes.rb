Rails.application.routes.draw do
  get 'post_comments/create'
  get 'post_comments/destroy'
   devise_for :users


  root to: "home#top"
  get 'home/about'
  resources :books do
  	resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update]
end
