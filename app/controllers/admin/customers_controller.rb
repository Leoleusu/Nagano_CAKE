class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "情報を更新しました。"
      redirect_to admin_customers_path
    else
      flash.now[:error] = "情報の更新に失敗しました。"
      render edit_admin_customer_path
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:email,:last_name,:last_name_kana,:first_name,:first_name_kana,:postal_code,:address,:telephone_number,:is_deleted)
  end
end
