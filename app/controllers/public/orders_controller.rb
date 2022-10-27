class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @address = Address.new
  end

  def confirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.postage = 800
    @cart_items = current_customer.cart_items.all
    if params[:order][:address_num] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
    elsif params[:order][:address_num] == "1"
      sel = Address.find(params[:order][:address_id])
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
    @orders = current_customer.orders.all
    
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.all
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
      cart_items = current_customer.cart_items.all
      cart_items.each do |c|
        order_detail = OrderDetail.new
        order_detail.item_id = c.item_id
        order_detail.order_id = @order.id
        order_detail.purchase_price = c.item.price
        order_detail.amount = c.amount
        order_detail.save
      end
      cart_items.destroy_all
      redirect_to orders_end_path
    else
      render 'public/orders/new'
    end
  end

  def end
  end

  private

  def order_params
    params.require(:order).permit(:postal_code,:address,:name,:postage,:payment,:payment_method,:is_active,:customer_id)
  end
end
