class Customer < ActiveRecord::Base
	has_many :addresses, :dependent => :destroy
	accepts_nested_attributes_for :addresses

	validates_presence_of :first_name, :last_name
end
