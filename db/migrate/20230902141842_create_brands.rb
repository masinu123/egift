class CreateBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :brands do |t|
      t.string :name, limit: 100
      t.integer :state, limit: 2
      t.jsonb :meta

      t.timestamps
    end
  end
end
