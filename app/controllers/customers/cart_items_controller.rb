class Customers::CartItemsController < ApplicationController
  def index
     @cart_items = current_customer.cart_items
     @total_price = calculate(current_customer)
  end

  # def create
  #   @cart_item = CartItem.new(cart_item_params)
  #   @cart_item.customer_id = current_customer.id
  #   @cart_item.save
  #   redirect_to cart_items_path
  # end

def create
   @cart_item = CartItem.new(cart_item_params)
   @cart_item.customer_id = current_customer.id
   @validate_into_cart = @cart_item.validate_into_cart
   if @validate_into_cart == false
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.quantity += params[:cart_item][:quantity].to_i
      cart_item.update(cart_item_params)
      redirect_to cart_items_path
   else
     @cart_item.save
     redirect_to cart_items_path
   end
 end

 #  def create
 #   @cart_item = CartItem.new(cart_item_params)
 #   @cart_item.customer_id = current_customer.id
 #   @validate_into_cart = @cart_item.validate_into_cart
 #   if @validate_into_cart == false
 #      flash[:into_cart_error] = "個数が選択されていないか、すでにカートに追加されているアイテムです。"
 #      redirect_to item_path(params[:cart_item][:item_id])
 #   else
 #     @cart_item.save
 #     redirect_to cart_items_path
 #   end
 # end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

private
def cart_item_params
  params.require(:cart_item).permit(:item_id, :customer_id, :quantity)
end

 def calculate(user)
   total_price = 0
   current_customer.cart_items.each do |cart_item|
     total_price += cart_item.quantity * cart_item.item.price
   end
   return (total_price * 1.1).floor
 end
end