class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items.all
  end

  def update
    @cart_item = current_customer.cart_items.find(params[:item_id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path
    else
      render 'public/cart_items/index'
    end
  end

  def destroy
    cart_item = current_customer.cart_items.find(params[:id])
    cart_item.destroy
    @cart_items = CartItem.all
    render 'public/cart_items/index'
  end

  def destroy_all
    cart_items = current_customer.cart_items.all
    cart_items.destroy_all
    @cart_items = current_customer.cart_items.all
    render 'public/cart_items/index'
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |ci|
      if ci.item_id == @cart_item.item_id
        new_amount = ci.amount + @cart_item.amount
        ci.update_attribute(:amount, new_amount)
        @cart_item.delete
      end
    end
    if @cart_item.save
      redirect_to cart_items_path
    else
      @cart_items = current_customer.cart_items.all
      render 'public/cart_items/index'
      @cart_item = CartItem.new(cart_item_params)
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id,:amount)
  end

end
