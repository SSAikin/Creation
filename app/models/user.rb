class User < ApplicationRecord
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

	has_many :players, class_name: "Player", foreign_key: :user_id


	def campaings
		Campaing.joins(players: :user).where(users: {id: self.id})
	end

	def new_campaing=(val)
		player = Player.new()
		player.user = self
		player.name = "#{self.nickname} master"
		player.master = true
		player.campaing = val
		player.save
	end
end
