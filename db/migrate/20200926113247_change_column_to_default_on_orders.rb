class ChangeColumnToDefaultOnOrders < ActiveRecord::Migration[5.2]
  def up
	change_column :orders, :order_status,:integer ,default: 0, null: false
	end

	def down
	change_column :orders, :order_status,:integer, null: false
	end
end
