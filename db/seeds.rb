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

4.times do |_n|
  product1 = Product.new(
    code1: shuffle_code('A', 'Z', 2),
    code2: shuffle_code('A', 'Z', 2),
    code3: shuffle_code('0', '9', 2),
    name: '商品名',
    description: '商品の説明',
    min_price: 40,
    stock: 1
  )

  product1.image.attach(io: File.open(Rails.root.join('app/assets/images/450300.jpg')), filename: '450300.jpg')

  product1.save!
end

3.times do |_n|
  product2 = Product.new(
    code1: shuffle_code('A', 'Z', 2),
    code2: shuffle_code('A', 'Z', 2),
    code3: shuffle_code('0', '9', 2),
    name: '商品名',
    description: '商品の説明',
    min_price: 40,
    max_price: 80,
    stock: 1
  )

  product2.image.attach(io: File.open(Rails.root.join('app/assets/images/450300.jpg')), filename: '450300.jpg')

  product2.save!
end

3.times do |_n|
  product3 = Product.new(
    code1: shuffle_code('A', 'Z', 2),
    code2: shuffle_code('A', 'Z', 2),
    code3: shuffle_code('0', '9', 2),
    name: '商品名',
    description: '商品の説明',
    min_price: 20,
    discount_price: 18,
    stock: 1,
    is_sale: true
  )

  product3.image.attach(io: File.open(Rails.root.join('app/assets/images/450300.jpg')), filename: '450300.jpg')

  product3.save!
end
