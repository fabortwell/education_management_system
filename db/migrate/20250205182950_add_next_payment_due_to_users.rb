class AddNextPaymentDueToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :next_payment_due, :datetime
  end
end
