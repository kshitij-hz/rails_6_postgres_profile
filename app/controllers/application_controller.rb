class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role_id, :avatar, :phone, address_attributes: [:line, :street, :landmark, :country, :state, :city, :pin_code]])
  end

  def after_sign_in_path_for(resource) 
    user_path(resource) 
  end

  def check_admin
    unless current_user && current_user.admin?
      redirect_to root_path
    end
  end
end
