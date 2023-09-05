unless User.exists?
  p 'Import Admin.........'
  admin = User.create! email: "admin@egift.com", password: "111111", password_confirmation: "111111"
  UserRole.create user_id: admin.id, role_id: Role.find_by(code: 'super_admin').id
end
