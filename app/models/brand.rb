class Brand < ApplicationRecord
  include StandardStateEnum
  include ActiveScope
end
