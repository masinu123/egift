# Oms::ApplicationController
module Oms
  class ApplicationController < ::ApplicationController
    layout 'oms'

    protected

    def js_reload
      render(js: %(window.location.reload())) and return
    end

    def paging(collection)
      # collection.page(params[:page]).per(per_page)
      collection
    end

    def per_page
      params[:per_page] || 10
    end
  end
end