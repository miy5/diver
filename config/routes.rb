Rails.application.routes.draw do
  namespace :admin do
    # get 'new', to: 'users#index'
    resources :users, only: [:index, :show, :destroy]
    resources :post_images, only: [:index, :show, :destroy]
    end

  devise_for :admins
  devise_for :users
  root 'post_images#index'
  resources :post_images do
  	resource :favorites, only: [:create, :destroy, :index]
  	resource :post_comments, only: [:create, :destroy, :edit, :update]
  end
  resources :users, only: [:show, :edit, :destroy, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
