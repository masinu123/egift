# SelectionSerializer::Base
module SelectionSerializer
  class Base < ResourceSerializer
    attributes :id, :text

    def id
      object.id.to_s
    end

    def text
      object.name
    end
  end
end
