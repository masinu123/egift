# OmsForm::Product
module OmsForm
  class Product < ::Product
    validates :name, presence: true
  end
end
