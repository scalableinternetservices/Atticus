class RegistrationsController < Devise::RegistrationsController
      protected
      
      def after_sign_up_path_for(resource)
      	  if (current_user.is_student)
      	     return '/students/new'
	  else
	     return '/companies/new'
	  end
      end
end
