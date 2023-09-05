#
module OmsService
  module Brand
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
          meta: {}
        )
      end
    end
  end
end
