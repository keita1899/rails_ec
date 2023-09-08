# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :products, only: %i[index new create edit update destroy]
  end
  root 'welcome#index'

  resources :products, only: %i[index show]
  get "checkout" => "carts#checkout" 
  post "add_item/:product_id" => "carts#add_item"
end
