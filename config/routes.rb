Rails.application.routes.draw do
  devise_for :admins

  namespace :admin do
    resources :products
    resources :orders
    resources :categories
    resources :users, only: [ :index, :show ]
    root "products#index"
  end

  devise_for :users

  resources :products, only: [:index, :show] do
    collection do
      get 'photos/:id' => 'products#photos'
    end
  end

  resources :cart_items, only: [:create, :destroy]
  resources :orders, only: [:create]
  get 'cart' => 'carts#show', as: :cart

  root 'products#index'
end
