class ApplicationController < ActionController::Base
  require 'rmagick'
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if current_user.icon_image.attached?
      "/#{current_user.nickname}"
    else
      user_edit_path(current_user)
    end


   end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:icon_image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:new_icon_image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:top_image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:new_top_image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:official_url])
    devise_parameter_sanitizer.permit(:account_update, keys: [:instagram_id])
  end
end
