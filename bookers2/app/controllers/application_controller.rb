class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:introduction])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:profile_image_id])
  end
  def after_sign_in_path_for(resource)
    if current_user
      flash[:notice] = "ログインに成功しました" 
      user_path(current_user.id)  #　指定したいパスに変更
    
    end
  end
  def after_sign_up_path_for(resource)
    if current_user
      flash[:notice] = "ログインに成功しました" 
      user_path(current_user.id)  #　指定したいパスに変更
    
    end
  end
end
