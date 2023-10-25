class RegistrationsController < Devise::RegistrationsController 
  before_action :configure_account_update_params, only: [:update]
 
  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :profile_image)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :profile_image)
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile_image])
  end


end
