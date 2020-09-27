class CartItem < ApplicationRecord
   # エラー
   validates :quantity, presence: true
   # 数量0以下に変更して保存されないように
   belongs_to :customer
   belongs_to :item

   # 小計
   def subtotal_price
      (quantity * item.price * Constants::TAX).round
   end
end
