class AddColumnSystemToCampaing < ActiveRecord::Migration[5.2]
	def change
		add_column :campaings, :system_id, :integer
	end
end
