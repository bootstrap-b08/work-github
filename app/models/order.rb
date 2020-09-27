class Order < ApplicationRecord
	belongs_to :customer
	has_many   :order_items, dependent: :destroy
	enum order_status: {入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済: 4}

	# 個数小計
	def total_count
		total = 0
		order_items.each do |order_item|
			total += order_item.count
		end
		total
	end



	# 商品合計
	def item_sum
		total = 0
		order_items.each do |order_item|
			total += order_item.subtotal_price
		end
		total
	end

	# 商品合計(注文確定後変動なし)
	def after_item_sum
		total = 0
		order_items.each do |order_item|
			total += order_price
		end
		total
	end

	# 請求金額合計(送料込み)
	def total_price
		total = 0
		order_items.each do |order_item|
			total += order_item.subtotal_price
		end
		total + shipping_cost
	end
end