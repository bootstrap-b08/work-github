class Admins::SearchesController < ApplicationController
	def search
		@word = params[:word]
		@range = params[:range]

		if @range == '1'
			@customers = Customer.search(@word).page(params[:page]).per(10)
		else
			@items = Item.search(@word).page(params[:page]).per(10)
		end
	end
end
