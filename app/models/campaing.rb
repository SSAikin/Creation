class Campaing < ApplicationRecord
	has_many :players, class_name: "Player", foreign_key: :campaing_id
	belongs_to :system, class_name: "System", foreign_key: :system_id
end
