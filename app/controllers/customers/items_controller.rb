class Customers::ItemsController < ApplicationController
  def index
    if params[:genre_id].present?
      @items = Item.where(genre_id: params[:genre_id])
      .page(params[:page]).per(8).reverse_order

      @item_genre = @items.first.genre if @items.count > 0
      @genre = Genre.find(params[:genre_id])
    else
      # ジャンルが無効になっている商品は一覧に表示しない
      @items = Item
        .joins(:genre).where(genres: {is_active: true})
        .page(params[:page]).per(8).reverse_order
    end
    @genres = Genre.where(is_active: true)# ジャンルが有効のみ
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new(item_id: @item.id)
    @genres = Genre.where(is_active: true)# ジャンルが有効のみ
  end

end