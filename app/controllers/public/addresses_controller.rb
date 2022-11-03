class Public::AddressesController < ApplicationController

  def index
    @addresses = current_customer.addresses.all
    @address = Address.new
  end

  def edit
    @address = current_customer.addresses.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:notice] = "新しい住所を登録しました。"
      redirect_to addresses_path
    else
      flash.now[:error] = "住所を登録できませんでした。"
      @addresses = current_customer.addresses.all
      render 'public/addresses/index'
      @address = Address.new
    end
  end

  def update
    @address = current_customer.address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = "情報を更新しました。"
      redirect_to addresses_path
    else
      flash.now[:error] = "情報を更新できませんでした。"
      render edit_address_path
    end
  end

  def destroy
    address = current_customer.addresses.find(params[:id])
    address.destroy
    flash[:notice] = "住所を削除しました。"
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:name,:postal_code,:address)
  end
end
