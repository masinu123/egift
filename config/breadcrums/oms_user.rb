# index
crumb :users do
  parent :oms_root
  link ::Brand.model_name.human(count: 2), oms_users_path
end

# show
crumb :user do |obj|
  parent :oms_root
  link ::Brand.model_name.human(count: 2), oms_users_path
  link obj.id, oms_user_path(obj)
end

# new
crumb :new_user do
  parent :oms_root
  link ::Brand.model_name.human(count: 2), oms_users_path
  link I18n.t('helpers.breadcrumbs.new', default: 'New')
end

# edit
crumb :edit_user do |obj|
  parent :oms_root
  link ::Brand.model_name.human(count: 2), oms_users_path
  link obj.id, oms_user_path(obj)
  link I18n.t('helpers.breadcrumbs.edit', default: 'Edit')
end
