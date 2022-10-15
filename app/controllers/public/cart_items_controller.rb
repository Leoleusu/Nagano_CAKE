class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
  end

  def update
    @cart_item = CartItem.find(params[:item_id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path
    else
      render 'public/cart_items#index'
    end
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    @cart_items = CartItem.all
    render 'public/cart_items#index'
  end

  def destroy_all
    cart_items = CartItem.all
    cart_items.destroy_all
    render 'public/cart_items#index'
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.save
      redirect_to items_path
    else
      @item = Item.find(params[:id])
      render 'public/items#show'
      @cart_item = CartItem.new
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id,:amount)
  end

end
