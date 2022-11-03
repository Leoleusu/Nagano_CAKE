class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
    @genres = Genre.all
  end

  def index
    @items = Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "商品を追加しました。"
      redirect_to admin_item_path(@item)
    else
      flash.now[:error] = "商品の追加に失敗しました。"
      render "admin/items/new"
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "商品情報の更新に成功しました。"
      redirect_to admin_items_path
    else
      flash.now[:error] = "商品情報の更新に失敗しました。"
      render edit_admin_item_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:genre_id,:image,:name,:introduction,:price,:is_active)
  end
end
