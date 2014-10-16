class CreateAddressTypes < ActiveRecord::Migration
	def change
		create_table :address_types do |t|
			t.string :add_type
			t.timestamps
		end
		AddressType.create(add_type: "Home")
		AddressType.create(add_type: "Office")
	end
end
