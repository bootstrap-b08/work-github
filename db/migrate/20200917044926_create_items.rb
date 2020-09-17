class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id,  null: false
      t.string :name,       null: false
      t.string :image_id,   null: false
      t.text :introduction, null: false
      t.integer :price,     null: false
      t.boolean :is_active, null: false, default: true
      # 商品の販売不・可 TRUE =販売可 FALSE =販売不可 初期では販売可

      t.timestamps
    end
  end
end
