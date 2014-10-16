class CustomersController < ApplicationController

	def index
		@customers = Customer.all 
	end

	def show
		@customer = Customer.find(params[:id]) 
	end

	def new
		@customer = Customer.new
		@address = @customer.addresses.new
	end

	def edit
		@customer = Customer.find(params[:id]) 
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

	def update
		@customer = Customer.find(params[:id])
		debugger
		if @customer.update(customer_params)
			flash[:notice] = "Customer updated succesfully"
			redirect_to customers_path
		else
			flash[:error] = "Error while updating customer"
			render :edit
		end
	end

	def destroy
		@customer = Customer.find(params[:id])
		@customer.destroy
	end

	private

	def customer_params
		params.require(:customer).permit(:first_name, :last_name, addresses_attributes: [:primary_address, :city, :state, :address_type_id] )
	end
	
end
