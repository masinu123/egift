class CreateProductPrices < ActiveRecord::Migration[7.0]
  def change
    create_table :product_prices do |t|
      t.decimal :value
      t.string :currency, limit: 5
      t.integer :product_id, limit: 8

      t.timestamps
    end
  end
end
