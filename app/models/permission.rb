class Permission < ApplicationRecord
  include StandardStateEnum
  
  belongs_to :user, optional: true
  belongs_to :product, optional: true
end
