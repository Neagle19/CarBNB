class ApplicationController < ActionController::Base

  # redirect to the desired page after sign out
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :email, :password, :last_name, :description, :location, :photo, :photo_cache])
  end
end
