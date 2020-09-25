# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Admin.create!(
# 	email: "admin@example.jp",
#       password:  "11111111",
# )

# # CustomerModel(2)
# Customer.create!(
# 	            id: 1,
#                   is_deleted: "true",
#                   family_name: "山田",
#                   first_name: "花子1号",
#                   family_name_kana: "ヤマダ",
#                   first_name_kana: "ハナコ",
#                   telephone_number: "00000000000",
#                   email: "hoge1@mail",
#                   password: "hogehoge",
#                   postel_code: "0000000",
#                   address: "東京都 渋谷区",
#                   )
# Customer.create!(
# 	 	      id: 2,
#                   is_deleted: "true",
#                   family_name: "山田",
#                   first_name: "花子2号",
#                   family_name_kana: "ヤマダ",
#                   first_name_kana: "ハナコ",
#                   telephone_number: "11111111111",
#                   email: "hoge2@mail",
#                   password: "hogehoge",
#                   postel_code: "1111111",
#                   address: "東京都 渋谷区",
#                   )

# Order.create!(
#       id: 1,
#       customer_id: 1,
#       delivery_name: '稲継亜矢子',
#       postal_code: '1111111',
#       shipping_address: '月川県岩青山町四南寺2-15',
#       payment_method: 'クレジットカード',
#       order_status: '入金待ち',
#       shipping_cost: 800,
#       billing_amount: 500,
#     )


# Order.create!(
#       id: 2,
#       customer_id: 2,
#       delivery_name: '鈴鹿由美子',
#       postal_code: '2222222',
#       shipping_address: '細野県城見市世史が丘3-1-7',
#       payment_method: 'クレジットカード',
#       order_status: '入金待ち',
#       shipping_cost: 800,
#       billing_amount: 1000,
#     )

# OrderItem.create!(
#       id: 1,
#       order_id: 1,
#       item_id: 1,
#       quantity: 4,
#       order_price: 270,
#       product_status: 2,
#     )

# OrderItem.create!(
#       id: 2,
#       order_id: 1,
#       item_id: 2,
#       quantity: 6,
#       order_price: 230,
#       product_status: 1,
#       )

Item.create!(
      id: 1,
      genre_id: 1,
      name: 'ショートケーキ',
      image_id: 1,
      introduction: 'イチゴが美味しいです。',
      price: 500,
      is_active: true,
      )

Item.create!(
      id: 2,
      genre_id: 2,
      name: 'プリン',
      image_id: 2,
      introduction: 'プルプルしてます。',
      price: 300,
      is_active: true,
      )

Genre.create!(
      id: 1,
      name: 'ケーキ',
      )

Genre.create!(
      id: 2,
      name: 'プリン',
      )
