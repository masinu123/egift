class AddPayoutRateToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :payout_rate, :decimal
  end
end
