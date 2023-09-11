# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :products, only: %i[index new create edit update destroy]
  end
  root 'welcome#index'

  resources :products, only: %i[index show]
  get 'checkout' => 'carts#index'
  post 'create/:product_id' => 'carts#create'
  delete 'destroy/:product_id' => 'carts#destroy'
end
