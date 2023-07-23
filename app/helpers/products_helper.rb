# frozen_string_literal: true

module ProductsHelper
  def image(product)
    product.image.attached? ? product.image : 'no-image.jpeg'
  end

  def format_price(price)
    "$#{price}.00"
  end
end