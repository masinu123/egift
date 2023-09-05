class CreatePermissions < ActiveRecord::Migration[7.0]
  def change
    create_table :permissions do |t|
      t.string :action, limit: 50
      t.string :subject_class, limit: 50
      
      t.timestamps
    end
  end
end
