class Admin::HomesController < ApplicationController

  def top
    @orders = Order.all
    #@customer = @order.customer
  end

end
