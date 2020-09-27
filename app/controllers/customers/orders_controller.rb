class Customers::OrdersController < ApplicationController

  def new
    @order = Order.new
    @address = Address.new
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @address = Adress.new(addressparams)
    @address.save
  end




  def confirm
    @item = CartItem
    @cart_items = current_customer.cart_items
    @order = current_customer
    # @address = Address.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :shipping_address, :delivery_name)
  end

  def address_params
    params.require(:address).permit(:post_code, :address, :name)
  end

  def set_address
    params.require(:order).require(:address).permit(:id)
  end

end