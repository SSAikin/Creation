class CampaingsController < ApplicationController

	def initial

	end

	def new
		@campaing = Campaing.new()
		@systems = System.all
		binding.pry
		render "campaings/js_render/new_campaing"
	end

	def create
		@campaing = Campaing.new(params_campaing)
		if @campaing.save
			current_user.new_campaing = @campaing
			render_save
		else
			flash[:error] = "Campaing invalid"
			render_not_save
		end
	end

	def show
		@id = params[:id]
		render "campaings/js_render/show_campaing_master"
	end

	def render_save
		@campaings = current_user.campaings
		render "campaings/js_render/created"
	end

	def params_campaing
		params.require(:campaing).permit(:name)
	end
end
