class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :shipping_address
      t.string :postal_code
      t.string :delivery_name
      t.integer :shipping_cost
      t.integer :billing_amount
      t.integer :payment_method
      t.integer :order_status

      t.timestamps
    end
  end
end
