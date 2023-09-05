# OmsService::Brand::Creator.new(params).exec
module OmsService
  module Brand
    class Creator < OmsService::Brand::Base
      attr_reader :params

      def initialize(params)
        @params = params
      end

      def exec
        normalize_params()
        ::Brand.create(resource_data)
      end
    end
  end
end
