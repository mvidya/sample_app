class CreateAddresses < ActiveRecord::Migration
	def change
		create_table :addresses do |t|
			t.text :primary_address
			t.string :city
			t.string :state
			t.belongs_to :customer
			t.belongs_to :address_type
			t.timestamps
		end
	end
end
