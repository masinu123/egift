# index
crumb :products do
  parent :oms_root
  link ::Brand.model_name.human(count: 2), oms_products_path
end

# show
crumb :product do |obj|
  parent :oms_root
  link ::Brand.model_name.human(count: 2), oms_products_path
  link obj.id, oms_product_path(obj)
end

# new
crumb :new_product do
  parent :oms_root
  link ::Brand.model_name.human(count: 2), oms_products_path
  link I18n.t('helpers.breadcrumbs.new', default: 'New')
end

# edit
crumb :edit_product do |obj|
  parent :oms_root
  link ::Brand.model_name.human(count: 2), oms_products_path
  link obj.id, oms_product_path(obj)
  link I18n.t('helpers.breadcrumbs.edit', default: 'Edit')
end
