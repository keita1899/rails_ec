class CartItem < ApplicationRecord
    belongs_to :cart
    belongs_to :product

    def sum_price
        product.min_price * quantity
    end

end
