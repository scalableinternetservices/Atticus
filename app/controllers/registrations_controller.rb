class RegistrationsController < Devise::RegistrationsController
  autocomplete :skill_tag, :name

  protected
    def after_sign_up_path_for(resource)
      return edit_profile_path(resource)
    end


 
end
