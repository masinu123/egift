# index
crumb :brands do
  parent :oms_root
  link ::Brand.model_name.human(count: 2), oms_brands_path
end

# show
crumb :brand do |obj|
  parent :oms_root
  link ::Brand.model_name.human(count: 2), oms_brands_path
  link obj.id, oms_brand_path(obj)
end

# new
crumb :new_brand do
  parent :oms_root
  link ::Brand.model_name.human(count: 2), oms_brands_path
  link I18n.t('helpers.breadcrumbs.new', default: 'New')
end

# edit
crumb :edit_brand do |obj|
  parent :oms_root
  link ::Brand.model_name.human(count: 2), oms_brands_path
  link obj.id, oms_brand_path(obj)
  link I18n.t('helpers.breadcrumbs.edit', default: 'Edit')
end
