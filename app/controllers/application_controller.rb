class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  before_action :update_allowed_parameters, if: :devise_controller?
  before_action :authenticate_user!
  include Devise::Controllers::Helpers

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :photo, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :photo, :password, :current_password)
    end
  end
end
