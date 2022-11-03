class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:notice] = "更新しました。"
      redirect_to admin_order_path(@order.id)
    else
      flash[:error] = "更新に失敗しました。"
      render admin_order_path(@order.id)
    end
  end

  private

  def order_params
    params.require(:order).permit(:postal_code,:address,:name,:postage,:payment,:payment_method,:is_active,:customer_id)
  end
end
