class Public::AddressesController < ApplicationController

  def index
    @addresses = Address.all
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new
    if @address.save
      redirect_to addresses_path
    else
      @addresses = Address.all
      render 'public/addresses/index'
      @address = Address.new
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path
    else
      render edit_address_path
    end
  end

  def destroy
  end

  private

  def address_params
    params.require(:address).permit(:customer_id,:name,:postal_code,:address)
  end
end
