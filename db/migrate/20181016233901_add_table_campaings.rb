class AddTableCampaings < ActiveRecord::Migration[5.2]
	def change
		create_table :campaings do |t|
			t.string  :name	
		end
	end
end
