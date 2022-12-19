class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_cart_items, only: [:new, :confirm, :create, :error]

  def new
    @order = Order.new
  end

  def confirm
  end

  def error
  end

  def create
  end

  def thanks
  end

  def index
  end

  def show
  end

  private

  def ensure_cart_items
    @cart_items = current_customer.cart_items.includes(:item)
    redirect_to items_path unless @cart_items.first
  end

end
