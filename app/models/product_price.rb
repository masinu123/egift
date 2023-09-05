class ProductPrice < ApplicationRecord
  belongs_to :product, optional: true
end
