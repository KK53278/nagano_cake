class Public::ItemsController < ApplicationController

  def index
    @genres = Genre.only_active
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      all_items = @genre.items
      # サイドバーからジャンルリンクを押したときの表示
    else
      all_items = Item.includes(:genre)
    end
    @items = all_items
    @all_items_count = all_items.count
  end

  def show
    @item = Item.where_genre_active.find(params[:id])
    # where_genre_activeはitemモデル内で定義genreテーブルから販売中のレコードを探す
    @genres = Genre.only_active
    # only_activeはcustomerモデルとgenreモデルで定義、有効のレコードを探す
    @cart_item = CartItem.new
  end

end

