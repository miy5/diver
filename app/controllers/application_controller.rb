class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
  	protected
  	def configure_permitted_parameters
  		devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email])
        devise_parameter_sanitizer.permit(:sign_im, keys: [:email])
 	end
 	# before_action :authenticate_user!
 	def after_sign_in_path_for(resource)
	  if admin_signed_in?
	  	 admin_users_path
     elsif user_signed_in?
     	 post_images_path
     	else
       post_images_path
     end
    end

 	 def after_sign_out_path_for(resource)
         post_images_path
    end

    def after_sign_up_path_for(resource)
    if user_signed_up?
     	 post_images_path
      else
       post_images_path
    end
    end

end