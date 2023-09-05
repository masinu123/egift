class CreateRolePermissions < ActiveRecord::Migration[7.0]
  def change
    create_table :role_permissions do |t|
      t.integer :role_id
      t.integer :permission_id

      t.timestamps
    end

    add_index :role_permissions, [:role_id, :permission_id], unique: true
    add_index :role_permissions, :permission_id
  end
end
