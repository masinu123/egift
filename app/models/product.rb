class Product < ApplicationRecord
  include StandardStateEnum
  include ActiveScope

  belongs_to :brand, optional: true
  has_many :prices, class_name: 'ProductPrice'

  accepts_nested_attributes_for :prices, allow_destroy: true

  delegate :name,
    to: :brand,
    prefix: true,
    allow_nil: true
end
