class RegistrationsController < Devise::RegistrationsController

  protected
    def after_sign_up_path_for(resource)
      return edit_profile_path(resource)
    end


 
end
