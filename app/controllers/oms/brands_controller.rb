#
module Oms
  class BrandsController < Oms::ResourcesController
    def selection
      render json: CollectionSerializer.new(::Brand.active, SelectionSerializer::Base, root: :data).to_json
    end

    def deactivate
      set_resource()
      if @resource
        OmsService::Brand::Deactivate.new(@resource).exec
        index()
      end
    end

    protected

    def klass
      ::Brand
    end

    def permitted_params
      params.require(:resource).permit(
        :name,
        meta: {}
      )
    end
  end
end
