class Admin::ItemsController < ApplicationController


  def new
    @item = Item.new
  end

  def index
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save 
     redirect_to admin_item_path(@item)
    else
     render("items/new")
    end
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
