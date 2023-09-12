# frozen_string_literal: true

class ProductsController < ApplicationController
  layout 'product'

  def index
    @products = Product.products_per_page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
    @recent_products = Product.recent.limit(4)
    @cart_item = current_cart.cart_items.new
  end
end
