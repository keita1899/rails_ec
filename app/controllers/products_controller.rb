# frozen_string_literal: true

class ProductsController < ApplicationController
  layout 'product'

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @recent_products = Product.recent.limit(4)
  end
end
