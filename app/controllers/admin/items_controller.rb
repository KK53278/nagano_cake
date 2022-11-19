class Admin::ItemsController < ApplicationController


  def new
    @item = Item.new
  end

  def index
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
    @item.save ? (redirect_to admin_items_path(@item)) : (render :new)
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :image, :price, :is_active)
  end

  def order_params
    params.require(:order).permit(:order_status)
  end
end
