class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customer_path
    else
      render edit_customer_path
    end
  end

  def unsubscribe
    @customer = Customer.find(params[:id])
  end

  def withdrawal
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会に成功しました。"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:email,:last_name,:last_name_kana,:first_name,:first_name_kana,:postal_code,:address,:telephone_number,:is_deleted)
  end

end
