class RegistrationsController < Devise::RegistrationsController
  prepend_before_action :require_no_authentication, only: [:new]  
  skip_before_action :require_no_authentication, only: [:new,:create]
  
  protected
  
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
