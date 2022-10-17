class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
    @addresses = Address.all
    
  end
  
  def index
  end
  
  def show
  end
  
  def create
  end
  
  def confirm
  end
  
  def end
  end
  
  private
  
  def order_params
    params.require(:order).permit(:)
  
end
