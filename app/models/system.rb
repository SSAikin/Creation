class System < ApplicationRecord
	
	has_many :campaings, class_name: "Campaing", foreign_key: :system_id
end
