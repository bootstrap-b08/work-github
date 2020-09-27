
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])

#   Character.create(name: 'Luke', movie: movies.first)
# CustomerModel(2)
Customer.create!(
                  is_deleted: "false",
                  family_name: "山田",
                  first_name: "花子1号",
                  family_name_kana: "ヤマダ",
                  first_name_kana: "ハナコ",
                  telephone_number: "00000000000",
                  email: "hoge2@mail",
                  password: "hogehoge",
                  postel_code: "0000000",
                  address: "東京都 渋谷区",
                  )
Customer.create!(
                  is_deleted: "false",
                  family_name: "山田",
                  first_name: "花子9号",
                  family_name_kana: "ヤマダ",
                  first_name_kana: "ハナコ",
                  telephone_number: "00000000000",
                  email: "hoge00@mail",
                  password: "hogehoge",
                  postel_code: "0000000",
                  address: "東京都 渋谷区",
                  )
Customer.create!(
                  is_deleted: "false",
                  family_name: "山田",
                  first_name: "花子2号",
                  family_name_kana: "ヤマダ",
                  first_name_kana: "ハナコ",
                  telephone_number: "11111111111",
                  email: "hoge8@mail",
                  password: "hogehoge",
                  postel_code: "1111111",
                  address: "東京都 渋谷区",
                  )
Admin.create!(
			    email: "admin@example.jp",
			    password:  "11111111",
			)

Genre.create!(
              name: "ケーキ",
              is_active: true
            )
Genre.create!(
              name: "プリン",
              is_active: true
            )
Genre.create!(
              name: "焼き菓子",
              is_active: true
            )
Genre.create!(
              name: "キャンディ",
              is_active: true
            )
# ItemModel
Item.create!(
              genre_id: 1,
              image_id: nil,
              name: "洋梨のチーズタルト",
              introduction: "北海道産の最高級カッテージチーズ＆最高級生クリームを贅沢に使用。",
              price: 1000,
              is_active: "販売可"
              )
Item.create!(
              genre_id: 1,
              image_id: nil,
              name: "いちごのショートケーキ",
              introduction: "あまおうを贅沢に使用。",
              price: 2000,
              is_active: "販売可"
              )
Item.create!(
              genre_id: 4,
              image_id: nil,
              name: "漢方のどあめ",
              introduction: "のどの痛みを緩和。",
              price: 300,
              is_active: "販売可"
              )
Item.create!(
              genre_id: 3,
              image_id: nil,
              name: "シェフの気まぐれマドレーヌ",
              introduction: "フランス産 最高級バターを贅沢に使用。",
              price: 500,
              is_active: "販売可"
              )
Item.create!(
              genre_id: 2,
              image_id: nil,
              name: "焼きプリン",
              introduction: "卵の風味が強いプリンを香ばしく焼き上げました。",
              price: 1000,
              is_active: "販売可"
              )
Item.create!(
              genre_id: 1,
              image_id: nil,
              name: "クリスマスドームケーキ",
              introduction: "クリスマスに豪華な一品をどうぞ。",
              price: 2000,
              is_active: "販売可"
              )

Address.create!(
  customer_id: 1,
  name: "赤羽の",
  post_code: "2222222",
  address: "東京都 新宿区 新宿3丁目",
)

 Address.create!(
   customer_id: 1,
   name: "羽の",
   post_code: "5555555",
   address: "東京都 新宿区 新宿4丁目",
 )



# order_itemの支払い金額（order_priceを計算する）
OrderItem.all.each do |order_item|
  order_item.update(order_price: order_item.item.price*order_item.quantity)
end
# orderの請求金額（billing_amount）を計算する
Order.all.each do |order|
  order.update(billing_amount: order.order_items.inject(0){|result, order_product| result + order_item.order_price })
end