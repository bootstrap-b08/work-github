
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
                  email: "hoge1@mail",
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
                  email: "hoge2@mail",
                  password: "hogehoge",
                  postel_code: "1111111",
                  address: "東京都 渋谷区",
                  )
Admin.create!(
				    email: "admin@example.jp",
				    password:  "11111111",
				)
