class Customers::ItemsController < ApplicationController


  def index
    @items = Item.all
    @items = Item.page(params[:page]).reverse_order
    @genres = Genre.all
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items.where(is_active: "true")
    else
      @items = Item.where(is_active: "true")
    end
  end


  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new(item_id: @item.id)
    price_with_tax
  end

  def create
  end


  private
  #追加
  def price_with_tax
    item = Item.find(params[:id])
    @price_tax = item.price * 1.1
  end
  #--↑

end