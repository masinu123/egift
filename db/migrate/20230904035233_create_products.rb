class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :state, limit: 2
      t.jsonb :meta
      t.integer :brand_id, limit: 8

      t.timestamps
    end

    add_index :products, :brand_id
  end
end
