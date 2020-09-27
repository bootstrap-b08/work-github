class Customers::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def index
    @orders = current_customer.orders.order("created_at DESC")
  end

  def new
    @order = Order.new
    @address = Address.new
  end

  def confirm
    @order = current_customer.orders.build(order_params)
    case params[:shipping_address_type]
    when "ご自身の住所"
      @order.postal_code = current_customer.postel_code
      @order.shipping_address = current_customer.address
      @order.delivery_name = current_customer.first_name + current_customer.family_name
    when "登録済み住所から選択"
      @order.postal_code = Address.find(set_address[:id]).post_code
      @order.shipping_address = Address.find(set_address[:id]).address
      @order.delivery_name = Address.find(set_address[:id]).name
    when "新しいお届け先"
    end
    # 請求金額の計算と格納
    @order.billing_amount = current_customer.cart_items.inject(0){|sum, cart_item| cart_item.subtotal_price + sum} + @order.shipping_cost
  end

  def create
    @order = current_customer.orders.build(order_params)
    if @order.save
        current_customer.cart_items.each do |cart_item|
          @order_items = OrderItem.new(
            item_id: cart_item.item.id,
            quantity: cart_item.quantity,
            order_price: (cart_item.item.price * Constants::TAX).round,
            order_id: @order.id)
            @order_items.save
          end
        Address.create!(customer_id: current_customer.id, post_code: @order.postal_code, address: @order.shipping_address, name: @order.delivery_name)
        # オーダー確定後ユーザーのカートを削除する
        current_customer.cart_items.destroy_all
    end
    redirect_to thanks_path
  end


  def show
    @order = Order.find(params[:id])
  end

  def thanks
  end

  private
  def order_params
    params.require(:order).permit(:billing_amount, :payment_method,:postal_code, :shipping_address, :delivery_name)
  end

  def set_address
    params.require(:order).require(:address).permit(:id ,:post_code ,:name ,:address)
  end

end