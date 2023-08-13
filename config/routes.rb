# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    get 'products/new'
    get 'products/edit'
    get 'products/index'
  end
  root 'welcome#index'

  resources :products, only: %i[index show]
end
