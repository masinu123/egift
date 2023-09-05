class Card < ApplicationRecord
  include StandardStateEnum
  include ActiveScope

  belongs_to :user, optional: true
  belongs_to :product, optional: true

  delegate :name,
    to: :product,
    prefix: true,
    allow_nil: true
end
