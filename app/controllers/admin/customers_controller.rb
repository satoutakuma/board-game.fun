class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    flash[:notice] = "会員情報を変更しました。"
    redirect_to admin_customer_path
  end
  private
  def customer_params
    params.require(:customer).permit(:name, :email, :is_active)
  end
end
