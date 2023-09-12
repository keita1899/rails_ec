# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :set_cart_item!, only: %i[create destroy]

  def index
    @cart_items = current_cart.cart_items.order(created_at: :desc)
    render layout: 'checkout'
  end

  def create
    increase(params[:product_id], params[:quantity])

    if @cart_item.save
      redirect_to params[:quantity].nil? ? request.referer : product_path(params[:product_id]), notice: 'カートに追加されました。'
    else
      
      if params[:quantity].nil?
        redirect_to request.referer, alert: 'カートに追加できませんでした。'
      else
        flash.now[:alert] = 'カートに追加できませんでした。'
        @product = Product.find_by(id: params[:product_id])
        @recent_products = Product.recent.limit(4)
        render 'products/show', status: :unprocessable_entity, layout: 'product'
      end
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

  def increase(product_id, quantity)
    @cart_item = current_cart.cart_items.build(product_id: product_id) if @cart_item.nil?
    @cart_item.quantity += quantity.nil? ? 1 : quantity.to_i
    @cart_item
  end
end
