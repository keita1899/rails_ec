# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :products, only: %i[index new create edit update destroy]
  end
  root 'welcome#index'

  resources :products, only: %i[index show]
end
