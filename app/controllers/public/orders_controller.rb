class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @address = Address.new
  end

  def confirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @cart_items = current_customer.cart_items.all
    if params [:order][:address_num] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.name
    elsif params [:order][:address_num] == "1"
      sel = Address.find(params[:order][:customer_id])
      @order.postal_code = sel.postal_code
      @order.address = sel.address
      @order.name = sel.name
    elsif params[:order][:address_num] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    else
      render "new"
    end
  end

  def index
  end

  def show
  end

  def create
  end

  def end
  end

  private

  def order_params
    params.require(:order).permit(:postal_code,:address,:name,:postage,:payment,:payment_method,:is_active,:customer_id)
  end
end
