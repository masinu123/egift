#
module ActsAsSelection
  def acts_as_selection(model_class, options = {})
    options[:method_name] ||= :selection
    define_method options[:method_name] do
      select_field  = options[:select_field] || 'id, name'
      serializer    = options[:serializer] || SelectionSerializer
      
      collection = model_class.select(select_field)

      collection = collection.where(id: params[:ids]) if params[:ids].present?
      # collection = collection.fulltext_search(params[:term]) if model_class.respond_to?(:fulltext_search) && params[:term].present?
      collection = collection.page(params[:page]).per(params[:per_page]) if collection.respond_to?(:page)

      render json: CollectionSerializer.new(collection, serializer, root: :data).to_json
    end
  end
end
