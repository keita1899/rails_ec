# frozen_string_literal: true

module ProductsHelper
  def image(product)
    product.image.attached? ? product.image : 'no-image.jpg'
  end

  def format_price(price)
    "#{price}円"
  end
end
