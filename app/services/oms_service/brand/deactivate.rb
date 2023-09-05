# OmsService::Brand::Deactivate.new(resource).exec
module OmsService
  module Brand
    class Deactivate < OmsService::DeactivateResource
      def exec
        deactivate_related_product()
        super()
      end

      private

      def deactivate_related_product
        collection = ::Product.where(brand_id: @resource.id)
        return if collection.blank?

        collection.find_in_batches(batch_size: 50) do |group|
          group.each do |item|
            OmsService::DeactivateResource.new(item).exec
          end
        end
      end
    end
  end
end
