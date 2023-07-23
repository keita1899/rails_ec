# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def shuffle_code(first_str, last_str, length)
  (first_str..last_str).to_a.shuffle[0..length].join
end

10.times do |_n|
  product = Product.create!(
    code1: shuffle_code('A', 'Z', 2),
    code2: shuffle_code('A', 'Z', 2),
    code3: shuffle_code('0', '9', 2),
    name: '商品名',
    description: '商品の説明',
    min_price: 40,
    max_price: 100,
    discount_price: 35,
    stock: 1
  )

  product.image.attach(io: File.open(Rails.root.join('app/assets/images/no-image.jpeg')), filename: 'no-image.jpeg')
end
