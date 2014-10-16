class Address < ActiveRecord::Base
	belongs_to :customer
	belongs_to :address_type

	validates_presence_of :primary_address, :city, :state
end
