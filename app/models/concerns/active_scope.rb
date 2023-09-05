# include ActiveScope
module ActiveScope
  extend ActiveSupport::Concern

  included do
    scope :active, -> { where state: 10 }

    def active?
      state == 'active'
    end
  end
end
