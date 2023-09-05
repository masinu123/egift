#
class Select2AjaxInput < SimpleForm::Inputs::CollectionSelectInput
  def input_html_options
    super.merge(class: 'select2Ajax full-width', multiple: options[:multiple], data: { url: options[:url], tags: options[:tags], separators: options[:separators], 'select2-params' => options[:select2_params] })
  end
end
