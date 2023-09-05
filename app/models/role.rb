class Role < ApplicationRecord
  has_many :role_permissions, class_name: 'RolePermission'
  has_many :permissions, through: :role_permissions, source: :permission
end
