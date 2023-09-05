#
module Api
  module V1
    class GetProductsController < Api::ApplicationController
      def call
        current_user = ::User.find_by(id: params[:user_id])
        unless current_user
          render_t_error(:resource_not_found)
          return
        end

        collection = ::Product.where(id: current_user.product_ids).order(id: :desc)
        if collection.blank?
          render_t_error(:resource_not_found)
          return
        end

        render json: CollectionSerializer.new(collection, ApiSerializer::Product, root: :data), status: :ok
      end
    end
  end
end
