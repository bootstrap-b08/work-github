class Admins::OrdersController < ApplicationController
	before_action :set_order, except: :index

	def index
		@orders = Order.all
	end

	def show
	end

	def update
	end
	
	private
	def set_order
	  @order = Order.find(params[:id])
	end
	
	def order_params
	  params.require(:order).permit(:shipping_addres, :postal_code, :delivery_name, :shipping_cost, :billing_amount, :payment_method, :order_status)
	end
end
