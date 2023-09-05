#
module Oms
  class CardsController < Oms::ResourcesController
    before_action :set_product_id, only: [:new]

    def index
      respond_to do |format|
        format.html do
          @collection = scoped_by_user()
          render :index
        end
      end
    end

    def activate
      set_resource()
      if @resource
        OmsService::Card::Activate.new(@resource).exec
        index()
      end
    end

    def deactivate
      set_resource()
      if @resource
        OmsService::DeactivateResource.new(@resource).exec
        index()
      end
    end

    protected

    def scoped_by_user
      return [] unless current_user
      return [] if current_user.roles.blank?

      collection = klass.all
      collection = collection.where(user_id: current_user.id) if current_user.client?
      collection.order(id: :desc)
    end

    def set_product_id
      @product_id = params['product_id']
    end

    def klass
      ::Card
    end

    def permitted_params
      params.require(:resource).permit(
        :product_id,
        :user_id,
        :name,
        :code,
        :pin_code,
        :expires_at,
        :state
      )
    end
  end
end
