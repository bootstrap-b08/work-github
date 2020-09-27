class Admins::CustomersController < ApplicationController
	before_action :authenticate_admin!
	before_action :set_customer, except: :index
	before_action :full_name, except: :index

	def index
		@customers = Customer.all
	end

	def show
		@full_name_kana = @customer.family_name_kana + @customer.first_name_kana
	end

	def edit
	end

	def update
		if set_customer.update(customer_params)
  	 	  redirect_to admins_customer_path, notice: 'You have updated customer successfully.'
    	else
      	  render :edit
    	end
	end

	private
	def set_customer
		@customer = Customer.find(params[:id])
	end

	def full_name
		@full_name = @customer.family_name + @customer.first_name
	end

	def customer_params
  	params.require(:customer).permit(:first_name, :first_name_kana, :family_name, :family_name_kana, :address, :email, :postel_code, :telephone_number, :is_deleted)
    end

end
