# OmsService::Card::Creator.new(params).exec
module OmsService
  module Card
    class Creator
      attr_reader :params

      def initialize(params)
        @params = params
      end

      def exec
        params[:state] = 'draft'
        ::Card.create(params)
      end
    end
  end
end
