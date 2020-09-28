class Customers::HomesController < ApplicationController
  def top
    if params[:genre_id].present?
      @items = Item.where(genre_id: params[:genre_id])
      .page(params[:page]).per(4).reverse_order

      @item_genre = @items.first.genre if @items.count > 0
    else
      # ジャンルが無効になっている商品は一覧に表示しない
      @items = Item
        .joins(:genre).where(genres: {is_active: true})
        .page(params[:page]).per(4).reverse_order
    end
    @genres = Genre.where(is_active: true)# ジャンルが有効のみ
  end

  def about
  end
end