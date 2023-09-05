# OmsForm::Brand
module OmsForm
  class Brand < ::Brand
    validates :name, presence: true
  end
end
