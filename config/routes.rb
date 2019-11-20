Rails.application.routes.draw do
  namespace :admin do
    resources :users, only: [:index, :show, :destroy]
    resources :post_images, only: [:index, :show, :destroy]
    end

  devise_for :admins
  root 'admin/users#index'

  devise_for :users
  root 'post_images#index'
  resources :post_images do
  	resource :favorites, only: [:create, :destroy]
  	resource :post_comments, only: [:create, :destroy, :edit, :update]
  end
  get 'favorites', to: 'favorites#index'
  delete 'post_images/:post_image_id/post_comments/destroy/:id', to: 'post_comments#destroy',as:'destroy_post_comment'
  resources :users, only: [:show, :edit, :destroy, :update, :top]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
