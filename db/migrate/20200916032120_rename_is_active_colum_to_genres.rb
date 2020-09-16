class RenameIsActiveColumToGenres < ActiveRecord::Migration[5.2]
  def change
    rename_column :genres, :IsActive, :is_active
  end
end
