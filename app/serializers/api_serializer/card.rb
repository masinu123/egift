#
module ApiSerializer
  class Card < ResourceSerializer
    attributes  :id,
                :name,
                :product_name,
                :code,
                :pin_code,
                :state
    
    def product_name
      object.product_name
    end
  end
end
