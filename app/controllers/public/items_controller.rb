class Public::ItemsController < ApplicationController

  def index
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      all_items = @genre.items
      # 既にあるジャンルを選択したitem
    else
      all_items = Item.includes(:genre)
      # ジャンルが新しく作られたitem
    end
    @items = all_items
    @all_items_count = all_items.count
  end

  def show
  end

end

