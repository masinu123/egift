#
module OmsService
  module Product
    class Base
      attr_reader :params

      protected

      def normalize_params
        params[:meta] ||= {}
        params[:meta] = params[:meta].compact_blank
      end

      def resource_data
        params.permit(
          :name,
          :brand_id,
          meta: {},
          prices_attributes: [
            :currency,
            :value,
            :id,
            :_destroy
          ]
        )
      end
    end
  end
end
