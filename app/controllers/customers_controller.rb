class CustomersController < ApplicationController

	def new
		@customer = Customer.new
		@address = @customer.addresses.new
	end

	def create
		@customer = Customer.new(customer_params)
		if @customer.save
			flash[:notice] = "Customer created succesfully"
			redirect_to customers_path
		else
			flash[:error] = "Error while creating customer"
			render :new
		end
	end

	def index
		@customers = Customer.all 
	end

	private

	def customer_params
		params.require(:customer).permit(:first_name, :last_name, addresses_attributes: [:primary_address, :city, :state, :address_type_id] )
	end
	
end
