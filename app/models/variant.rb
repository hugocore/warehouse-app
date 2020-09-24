class Variant < ApplicationRecord
  include Discard::Model

  belongs_to :product

  validates :sku, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :sku, uniqueness: { conditions: -> { where(discarded_at: nil) } }
end
