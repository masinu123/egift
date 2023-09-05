# OmsService::Card::Activate.new(resource).exec
module OmsService
  module Card
    class Activate
      attr_reader :resource

      def initialize(resource)
        @resource = resource
      end

      def exec
        return unless resource.state_draft?
        
        resource.update(state: 'active', activation_code: generate_activate_code)
        resource
      end

      private

      def generate_activate_code 
        [*('0'..'9')].sample(6).join
      end
    end
  end
end
