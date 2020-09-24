class Customers::OrdersController < ApplicationController

  def new
    @order = Order.new
    @address = Address.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
       redirect_to orders_confirm_path
    end
  end

  def confirm
    @item = CartItem
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :shipping_address, :delivery_name)
  end

end