class Users::RegistrationsController < Devise::RegistrationsController
	def sign_up_params
		params.require(:user).permit(:name, :email, :password)
	end
	
	def account_update_params
		params.require(:user).permit(:name, :email, :password, :author_profile, :avatar)
	end
	
	def update_resource(resource, params)
      if params[:password].blank? && params[:password_confirmation].blank? && params[:current_password].blank?
      resource.update_without_password(params)
      else
        super
      end
    end
end
