class CangeColumnToNull < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :items, :image_id, true
  end
end
