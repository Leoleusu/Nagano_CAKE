class Admin::OrdersController < ApplicationController
  
  def show
    @order = Order.find(params[:id])
  end
  
  private
  
  def order_id
    params.require(:order).permit(:postal_code,:address,:name,:postage,:payment,:payment_method,:is_active,:customer_id)
  end
end
