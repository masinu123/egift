class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.string :name
      t.string :code
      t.string :description
      t.boolean :is_system

      t.timestamps
    end

    add_index :roles, :code, unique: true
  end
end
