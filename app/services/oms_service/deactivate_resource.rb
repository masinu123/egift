# OmsService::DeactivateResource.new(resource).exec
module OmsService
  class DeactivateResource
    attr_reader :resource

    def initialize(resource)
      @resource = resource
    end

    def exec
      resource.update(state: 'inactive')
      resource
    end
  end
end
