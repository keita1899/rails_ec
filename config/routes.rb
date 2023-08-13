# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    get 'products/new'
    get 'products/edit'
    get 'products/index'
  end
  root 'welcome#index'

  resources :products, only: %i[index show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
