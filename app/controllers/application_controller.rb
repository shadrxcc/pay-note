class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :image])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :image])
  end

  protect_from_forgery with: :exception
end
