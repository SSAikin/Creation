class Player < ApplicationRecord
	belongs_to :user, class_name: "User", foreign_key: :user_id
	belongs_to :campaing, class_name: "Campaing", foreign_key: :campaing_id

end
