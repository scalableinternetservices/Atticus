class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name, :is_student, :email, :password, :first_name, :last_name, :corporation, :school, :image_url, :profile )}
        devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :is_student)}
        devise_parameter_sanitizer.for(:profile_update) { |u| u.permit(:is_student, :first_name, :last_name, :corporation, :school, :profile)}
    end

end
