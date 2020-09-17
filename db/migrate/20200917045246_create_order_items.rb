class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer  :order_id,       null: false
      t.string   :item_id,        null: false
      t.integer  :order_price,    null: false
      t.integer  :quantity,       null: false
      t.integer  :product_status, null: false, default: 0
      # e num設定 ０= 着手不可、１= 製作待ち、２= 製作中、３= 製作完了 初期値は0(着手不可)

      t.timestamps
    end
  end
end

