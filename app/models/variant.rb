class Variant < ApplicationRecord
  belongs_to :product

  validates :sku, presence: true, uniqueness: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
