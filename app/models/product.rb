class Product < ApplicationRecord
  include Discard::Model

  has_many :variants, dependent: :destroy

  MAX_DESCRIPTION_LENGTH = 300

  validates :title, presence: true
  validates :description, length: { maximum: MAX_DESCRIPTION_LENGTH }, allow_blank: true
  validates :variants, presence: true
  validates :title, uniqueness: { conditions: -> { where(discarded_at: nil) } }

  accepts_nested_attributes_for :variants, allow_destroy: true

  def stock_quantity
    variants.sum(:quantity)
  end
end
