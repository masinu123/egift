#
module Api
  module V1
    class GetCardsController < Api::ApplicationController
      def call
        collection = ::Card.where(user_id: params[:user_id]).order(id: :desc)
        if collection.blank?
          render_t_error(:resource_not_found)
          return
        end

        render json: CollectionSerializer.new(collection, ApiSerializer::Card, root: :data), status: :ok
      end
    end
  end
end
