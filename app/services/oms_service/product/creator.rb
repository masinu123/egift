# OmsService::Product::Creator.new(params).exec
module OmsService
  module Product
    class Creator < OmsService::Product::Base
      attr_reader :params

      def initialize(params)
        @params = params
      end

      def exec
        normalize_params()
        ::Product.create(resource_data)
      end
    end
  end
end
