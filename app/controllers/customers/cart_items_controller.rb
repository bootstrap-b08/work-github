class Customers::CartItemsController < ApplicationController
  def index
     @customer = Customer.find(current_customer.id)
     @cart_items = current_customer.cart_items
     @total_price = calculate(current_customer)
  end

def create
  @cart_item = current_customer.cart_items.new(cart_item_params)
  if @cart_item.quantity != nil
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
        if cart_item.item_id == @cart_item.item_id
          new_quantity = cart_item.quantity + @cart_item.quantity
          cart_item.update_attribute(:quantity, new_quantity)
          @cart_item.delete
        end
      end
        @cart_item.save
        redirect_to :cart_items
      else
        redirect_to request.referrer
      end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    @customer = Customer.find(current_customer.id)
    render :index
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    if cart_item.destroy
      flash[:notice] = "カート内の商品を削除しました。"
      redirect_to cart_items_path
    else
      render action: :index
    end
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :quantity)
  end
end