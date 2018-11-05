class ApplicationController < ActionController::Base
	before_action :authenticate_user!, :load_side_bar
	before_action :configure_permitted_parameters, if: :devise_controller?

	def load_side_bar
		@campaings = current_user.campaings if user_signed_in?
	end
	
	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :nickname, :email, :password, :password_confirmation])
	end
end
