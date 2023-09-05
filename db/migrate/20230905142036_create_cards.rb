class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.integer :product_id, limit: 8
      t.integer :user_id, limit: 8
      t.string :name
      t.string :code
      t.integer :state, limit: 2
      t.datetime :expires_at
      t.string :activation_code
      t.string :pin_code

      t.timestamps
    end

    add_index :cards, :user_id
  end
end
