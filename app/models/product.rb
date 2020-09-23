class Product < ApplicationRecord
  has_many :variants, dependent: :destroy

  MAX_DESCRIPTION_LENGTH = 300.freeze

  validates :title, presence: true, uniqueness: true
  validates :description, length: { maximum: MAX_DESCRIPTION_LENGTH }, allow_blank: true
  validates :variants, presence: true

  accepts_nested_attributes_for :variants, allow_destroy: true
end
