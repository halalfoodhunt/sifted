class Users::RegistrationsController < Devise::RegistrationsController
def sign_up_params
		params.require(:merchant).permit(:name, :email, :password, :author_profile)
	end
	
	def account_update_params
		params.require(:merchant).permit(:name, :email, :password, :author_profile)
	end
end
