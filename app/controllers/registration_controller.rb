class RegistrationController < Devise::RegistrationsController
include RegistrationHelper


  before_filter :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit({company_or_student: []},:username, :email, :password, :password_confirmation) }
  end
  
  def create
    @user = User.create(sign_up_params)
    super
  end



  private
  
  def new 
    super
  end

  def sign_up_params
    params.require(:user).permit(:company_or_student, :email, :password, :password_confirmation)
  end
    
  def account_update_params
    params.require(:user).permit(:company_or_student, :email, :password, :password_confirmation, :current_password)
  end
 

  def update
    super
  end



end
