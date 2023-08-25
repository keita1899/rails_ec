# frozen_string_literal: true

class Product < ApplicationRecord
  has_one_attached :image

  scope :recent, -> { order(created_at: :desc) }

  validates :image, blob: { content_type: :image, size_range: 1..5.megabytes }
  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :stock, presence: true, numericality: { only_integer: true }
  validates :min_price, presence: true, numericality: { only_integer: true }
  validates :max_price, numericality: { only_integer: true, allow_nil: true, greater_than: :min_price }

  def shuffle_code(first_str, last_str, length)
    (first_str..last_str).to_a.shuffle[0..length].join
  end
end
