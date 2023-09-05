unless Permission.where(subject_class: 'User').exists?
  p 'Import Permission User.........'
    %w(manage read create update destroy).each do |action|
    Permission.create subject_class: 'User', action: action
  end
end

unless Permission.where(subject_class: 'Brand').exists?
  p 'Import Permission Brand.........'
    %w(manage read create update destroy).each do |action|
    Permission.create subject_class: 'Brand', action: action
  end
end

unless Permission.where(subject_class: 'Product').exists?
  p 'Import Permission Product.........'
  %w(manage read create update destroy).each do |action|
    Permission.create subject_class: 'Product', action: action
  end
end

unless Permission.where(subject_class: 'Cart').exists?
  p 'Import Permission Cart.........'
  %w(manage read create update destroy).each do |action|
    Permission.create subject_class: 'Cart', action: action
  end
end

unless Role.exists?
  p 'Import Role.........'
  Role.create code: :super_admin, name: 'Super Admin', is_system: true
  client_role = Role.create code: :client, name: 'Client'
  RolePermission.create role_id: client_role.id, permission_id: Permission.find_by(action: "manage", subject_class: "Product").id
  RolePermission.create role_id: client_role.id, permission_id: Permission.find_by(action: "read", subject_class: "Card").id
end
