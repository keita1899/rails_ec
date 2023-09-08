class CartsController < ApplicationController

    before_action :set_cart_item!, only: %i[add_item ]

    def checkout
        @cart_items = current_cart.cart_items
        render :layout => 'checkout'
    end

    def add_item
        @cart_item = current_cart.cart_items.build(product_id: params[:product_id]) if @cart_item.nil?
        @cart_item.quantity += 1

        if @cart_item.save 
            redirect_to request.url, notice: "カートに追加されました。"
        else
            flash.now[:alert] = "カートに追加できませんでした。"
            @products = Product.recent.all
            render 'products/index', status: :unprocessable_entity
        end
    end

    private

    def set_cart_item!
        @cart_item = current_cart.cart_items.find_by(product_id: params[:product_id])
    end

end