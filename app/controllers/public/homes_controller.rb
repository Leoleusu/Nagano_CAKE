class Public::HomesController < ApplicationController
  def top
    @items = Item.all
    @items = Item.all.order(id: :desc)
  end

  def about
  end
end
