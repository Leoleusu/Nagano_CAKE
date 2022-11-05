class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    order = Order.find(@order_detail.order_id)
    @order_details = order.order_details
    count = 0
    if @order_detail.update(order_detail_params)
      if @order_detail.is_active == "production"
        order.update(is_active: 2)
      end

      @order_details.each do |od|
        if od.is_active == "finished"
          count += 1
        end
      end

      if count == @order_details.count
         order.update(is_active: 3)
      end

      flash[:notice] = "情報を更新しました。"
      redirect_to admin_order_path(@order_detail.order.id)
    else
      flash.now[:error] = "情報の更新に失敗しました。"
      render "admin/orders/show"
    end
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:purchase_price,:amount,:is_active)
  end
end
