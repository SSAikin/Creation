class RegistrationsController < Devise::RegistrationsController

	private

	def configure_sign_up_params
		devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute, :first_name])
	end

	def account_update_params
		params.require(:user).permit(:first_name, :last_name, :nickname, :email, :password, :password_confirmation, :current_password)
	end
end