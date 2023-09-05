#
module ApiSerializer
  class Product < ResourceSerializer
    attributes  :id,
                :name,
                :brand,
                :state,
                :meta

    def brand
      object.brand_name
    end
  end
end
