class Customers::ItemsController < ApplicationController
  # def index
  #   @items = Item.page(params[:page]).per(8)
  #   @genres = Genre.all
  #   if params[:genre_id]
  #     @genre = Genre.find(params[:genre_id])
  #     @items = @genre.items.where(is_active: "true")
  #   else
  #     @items = Item.where(is_active: "true")
  #   end
  # end

  def index
      @genres = Genre.where(is_active: true)# ジャンルが有効のみ

      # もしURLに[:genre_id]が含まれていたら
    if params[:genre_id]
      # その[:genre_id]のデータをGenreから@genreに格納
      @genre = Genre.find(params[:genre_id])
      # @genreに紐付いた商品で販売可の商品を引っ張る（作成順の昇順）
      @items = @genre.items.order(created_at: :desc).where(is_active: true).page(params[:page]).per(8)
      # 含まれていなければ
    else
      @items = Item.where(is_active: true).page(params[:page]).per(8)
     # 販売ステータスが販売可のみの商品を参照 ジャンル作成の昇順
    end
  end


  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new(item_id: @item.id)
  end

  def create
  end

end