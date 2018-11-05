class AddTablePlayers < ActiveRecord::Migration[5.2]
	def change
		create_table :players do |t|
			t.integer :user_id, null: false
			t.integer :campaing_id, null: false
			t.string  :name
		end
	end
end
