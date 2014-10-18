class CustomersController < ApplicationController

	def index
		@customers = Customer.all 
	end

	def show
		@customer = Customer.find(params[:id]) 
	end

	def new
		@customer = Customer.new
		2.times { @customer.addresses.build }
		# @address = @customer.addresses.new
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
		if @customer.update_attributes(customer_params)
			flash[:notice] = "Customer updated succesfully"
			redirect_to customers_path
		else
			flash[:error] = "Error while updating customer"
			render :edit
		end
	end

	def destroy
		@customer = Customer.find(params[:id])
		if @customer.destroy
			flash[:notice] = "Customer deleted succesfully"
		else
			flash[:error] = "Error while deleting customer"
		end
		redirect_to customers_path
	end

	private

	def customer_params
		params.require(:customer).permit(:first_name, :last_name, addresses_attributes: [:id, :primary_address, :city, :state, :address_type_id] )
	end
	
end
	