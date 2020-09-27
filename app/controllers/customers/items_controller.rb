class Customers::ItemsController < ApplicationController


  def index
    # @items = Item.all
    @genres = Genre.all
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items.where(is_active: "true")
    else
      @items = Item.where(is_active: "true")
    end
      @items = Item.page(params[:page]).per(10)
  end


  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new(item_id: @item.id)
  end

  def create
  end

end