class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(order_detail_params)
      redirect_to admin_order_path(@order_detail.order.id)
    else
      render admin_order_path(@order_detail.order.id)
    end
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:purchase_price,:amount,:is_active)
  end
end
