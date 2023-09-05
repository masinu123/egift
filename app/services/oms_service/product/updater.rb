# OmsService::Product::Updater.new(resource, params).exec
module OmsService
  module Product
    class Updater < OmsService::Product::Base
      attr_reader :resource, :params

      def initialize(resource, params)
        @resource = resource
        @params   = params
      end

      def exec
        normalize_params()
        resource.update(resource_data)
        resource
      end
    end
  end
end
