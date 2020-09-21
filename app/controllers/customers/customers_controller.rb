class CustomersController < ApplicationController
      before_action :ensure_correct_customer, {only: [:show, :edit]}


  def show
  	@customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:success] = "You have edited user data successfully."
      redirect_to customer_path(@customer)
    else
      render 'edit'
    end
  end

    def unsubscribe #退会画面を表示するアクション
    end

    def withdrow
       @customer = Customer.find(params[:id])
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

  def ensure_correct_customer
    @customer = Customer.find(params[:id])
    if current_customer.id != @customer.id
       redirect_to root_path
    end
  end

end
