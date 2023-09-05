#
class Select2Input < SimpleForm::Inputs::CollectionSelectInput
  def input(wrapper_options)
    options[:prompt] ||= false
    input_html_classes << 'select2Normal'
    super(wrapper_options)
  end

  def input_html_options
    super.merge(multiple: options[:multiple], data: { tags: options[:tags], separators: options[:separators], placeholder: options[:placeholder] })
  end
end
