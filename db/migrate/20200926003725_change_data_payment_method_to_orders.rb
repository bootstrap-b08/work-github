class ChangeDataPaymentMethodToOrders < ActiveRecord::Migration[5.2]
  def change
  	change_column :orders, :payment_method, :string
  end
end
