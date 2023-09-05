#
module Oms
  class ProductsController < Oms::ResourcesController
    def index
      respond_to do |format|
        format.html do
          @collection = scoped_by_user()
          render :index
        end
      end
    end

    def selection
      render json: CollectionSerializer.new(::Product.active, SelectionSerializer::Base, root: :data).to_json
    end

    def request_card
      return unless current_user

      set_resource()

    end

    def deactivate
      set_resource()
      if @resource
        OmsService::DeactivateResource.new(@resource).exec
        index()
      end
    end
    
    protected

    def scoped_by_user()
      return [] unless current_user
      return [] if current_user.roles.blank?

      collection = klass.all
      collection = collection.where(id: current_user.product_ids) if current_user.client?
      collection.order(id: :desc)
    end

    def klass
      ::Product
    end

    def permitted_params
      params.require(:resource).permit(
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
