class CartsController < ApplicationController

    def checkout
        @cart_items = current_cart.cart_items
        render :layout => 'checkout'
    end

end