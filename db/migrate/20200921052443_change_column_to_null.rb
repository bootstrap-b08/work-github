class ChangeColumnToNull < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :items, :is_active, true
  end
end
