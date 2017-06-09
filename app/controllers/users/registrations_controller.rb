class Users::RegistrationsController < Devise::RegistrationsController
	def sign_up_params
		params.require(:user).permit(:name, :email, :password)
	end
	
	def account_update_params
		params.require(:user).permit(:name, :email, :password, :author_profile, :avatar)
	end
end
