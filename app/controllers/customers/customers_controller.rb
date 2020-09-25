class Customers::CustomersController < ApplicationController
      before_action :authenticate_customer!

  def show
  	@customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    if current_customer.update customer_params
      flash[:success] = "You have edited user data successfully."
      redirect_to customers_path
    else
      render 'edit'
    end
  end

  def unsubscribe #退会画面を表示するアクション
  end

  def withdraw
     @customer = current_customer
     if @customer.update(is_deleted: true)
        sign_out current_customer #URLを踏ませずにコントローラーから直接サインアウトの指示を出す（device公式)
     end
     redirect_to root_path
  end



  private
  def customer_params
  	  params.require(:customer).permit(:is_deleted, :family_name, :first_name, :family_name_kana, :first_name_kana,
  	                                   :telephone_number, :email, :password, :postel_code, :address)
  end

end
