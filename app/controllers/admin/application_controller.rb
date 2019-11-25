class Admin::ApplicationController < ActionController::Base
  	protected
  	def configure_permitted_parameters
  		devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
 	end
 	before_action :authenticate_admin!
end
