class Admins::OrdersController < ApplicationController
	before_action :authenticate_admin!
	before_action :set_order, except: [:index]

	def index
		@orders = Order.page(params[:page]).per(10)
	end

	def show
	end

	def order_status_update
		@order.update(order_params)
		if @order.order_status == "入金確認"
			@order.order_items.update(product_status: 1)
		end
		redirect_back(fallback_location: root_path)
	end


	def product_status_update
		@order_item = OrderItem.find(params[:id])
		@order_item.update(product_status_params)
		if @order_item.product_status == "製作中"
			@order_item.order.update(order_status: 2)
		end
		if @order_item.product_status == "製作完了"
			@order_item.order.update(order_status: 3)
		end
		redirect_back(fallback_location: root_path)
	end

	private
	def set_order
	  @order = Order.find(params[:id])
	end

	def order_params
	  params.require(:order).permit(:shipping_addres, :postal_code, :delivery_name, :shipping_cost, :billing_amount, :payment_method, :order_status)
	end

	def product_status_params
	  params.require(:order_item).permit(:product_status)
	end

	def item_params
	  params.require(:item).permit(:price)
	end

	# def order_price
	#   item = Item.find(params[:id])
	#   order_price = (item.price * 1.1).round
	# end
end
