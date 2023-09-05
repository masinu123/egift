#
module Api
  module V1
    class RequestCardController < Api::ApplicationController
      def call
        current_user = ::User.find_by(id: params[:user_id])
        unless current_user
          render_t_error(:resource_not_found)
          return
        end

        product = ::Product.find_by(id: params[:product_id])
        if product.blank?
          render_t_error(:resource_not_found)
          return
        end

        card = OmsService::Card::Creator.new(permitted_params).exec
        render json: ApiSerializer::Card.new(card, root: :data), status: :ok
      end

      private

      def permitted_params
        params.permit(
          :product_id,
          :user_id,
          :name,
          :code,
          :pin_code,
          :expires_at
        )
      end
    end
  end
end
