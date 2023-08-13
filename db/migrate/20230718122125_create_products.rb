# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :code1, null: false, limit: 3
      t.string :code2, null: false, limit: 3
      t.string :code3, null: false, limit: 3
      t.string :name, null: false
      t.text :description, null: false
      t.integer :min_price, null: false
      t.integer :max_price
      t.integer :discount_price
      t.integer :stock, null: false, default: 0
      t.boolean :is_sale, null: false, default: false

      t.timestamps
    end
  end
end
