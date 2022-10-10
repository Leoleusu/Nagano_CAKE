class Public::CartItemsController < ApplicationController
  
  def index
    @cart_items = Cart_item.all
    @cart_item.item = Item.find(params[:id])
  end
  
  def update
  end

  def destroy
  end
  
  def destroy_all
  end
  
  def create
  end
  
end
