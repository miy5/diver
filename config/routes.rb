Rails.application.routes.draw do
  devise_for :users
  root 'post_images#index'
  resources :post_images do
  	resource :favorites, only: [:create, :destroy, :index]
  	resource :post_comments, only: [:create, :destroy, :edit, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
