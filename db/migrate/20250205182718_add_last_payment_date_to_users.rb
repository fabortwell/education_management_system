class AddLastPaymentDateToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :last_payment_date, :datetime
  end
end
