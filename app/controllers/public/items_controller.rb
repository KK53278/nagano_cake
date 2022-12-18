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
  end

end

