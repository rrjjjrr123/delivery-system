class ApplicationController < ActionController::Base

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name,
:phone_no,:user_type])
  end

  def after_sign_in_path_for(resource)
    if resource.admin? 
      admins_path
    elsif resource.shopkeeper?
      shopkeepers_path         
    else 
      request.env['omniauth.origin'] || stored_location_for(resource) ||  root_path 
    end   
  end

end
