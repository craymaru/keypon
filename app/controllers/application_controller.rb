class ApplicationController < ActionController::Base
  # DEVISE
  before_action :configure_permitted_parameters, if: :devise_controller?

  # FLASH MESSAGE TYPES
  add_flash_types :success, :info, :warning, :danger

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  protected

  # DEVISE STRONG PARAMS
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name, :biography])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :name, :biography])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :name])
  end
end
