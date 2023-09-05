class CreateProductManages < ActiveRecord::Migration[7.0]
  def change
    create_table :product_manages do |t|
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end

    add_index :product_manages, [:user_id, :product_id], unique: true
    add_index :product_manages, :product_id
  end
end
