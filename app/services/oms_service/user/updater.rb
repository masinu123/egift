# OmsService::User::Updater.new(resource, params).exec
module OmsService
  module User
    class Updater
      attr_reader :resource, :params

      def initialize(resource, params)
        @resource = resource
        @params   = params
      end

      def exec
        product_ids = params[:products].reject(&:blank?)
        params[:products] = ::Product.where(id: product_ids)
        resource.update(params)
        resource
      end
    end
  end
end
