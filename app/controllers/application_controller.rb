class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def default_serializer_options
    {root: false}
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).concat [:first_name, :last_name, :admin]
    devise_parameter_sanitizer.for(:account_update).concat [:first_name, :last_name, :pen_color, :admin]
  end

  def after_sign_in_path_for(resource)
	homeroom_user_path(current_user)
  end

  def after_sign_up_path_for(resource)
    homeroom_user_path(current_user)
  end

end