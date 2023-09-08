class Cart < ApplicationRecord
    has_many :cart_items, dependent: :destroy

    def count_cart_items
        @count_cart_items = cart_items.inject(0) { |sum, item| sum + item.quantity }
    end

    def total_price
        @total_price = cart_items.inject(0) { |sum, item| sum + item.sum_price }
    end
end
