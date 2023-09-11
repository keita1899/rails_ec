# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :set_cart_item!, only: %i[add_item add_items destroy]

  def index
    @cart_items = current_cart.cart_items.order(created_at: :desc)
    render layout: 'checkout'
  end

  def add_item
    @cart_item = current_cart.cart_items.build(product_id: params[:product_id]) if @cart_item.nil?
    @cart_item.quantity += 1

    if @cart_item.save
      redirect_to request.url, notice: 'カートに追加されました。'
    else
      flash.now[:alert] = 'カートに追加できませんでした。'
      @products = Product.recent.all
      render 'products/index', status: :unprocessable_entity, layout: 'product'
    end
  end

  def add_items
    @cart_item = current_cart.cart_items.build(product_id: params[:product_id]) if @cart_item.nil?
    @cart_item.quantity += params[:quantity].to_i

    if @cart_item.save
      redirect_to product_path(params[:product_id]), notice: 'カートに追加されました。'
    else
      flash.now[:alert] = 'カートに追加できませんでした。'
      @product = Product.find_by(id: params[:product_id])
      @recent_products = Product.recent.limit(4)
      render 'products/show', status: :unprocessable_entity, layout: 'product'
    end
  end

  def destroy
    if @cart_item.destroy
      redirect_to checkout_path, notice: 'カートの商品を削除しました。'
    else
      render :checkout, status: :see_other
    end
  end

  private

  def set_cart_item!
    @cart_item = current_cart.cart_items.find_by(product_id: params[:product_id])
  end
end
