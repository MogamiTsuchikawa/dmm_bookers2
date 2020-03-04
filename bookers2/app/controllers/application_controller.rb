class ApplicationController < ActionController::Base
    
    before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:introduction])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:profile_image_id])
    added_attrs = [:name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
  def after_sign_in_path_for(resource)
    if current_user
      flash[:notice] = "sign in successfully" 
      user_path(current_user.id)  #　指定したいパスに変更
    
    end
  end
  def after_sign_up_path_for(resource)
    if current_user
      flash[:notice] = "Welcome! You have signed up successfully." 
      user_path(current_user.id)  #　指定したいパスに変更
    
    end
  end
  def after_logout_path_for(resource)
    flash[:notice] = "logout successfully"
    "/"
  end
end
