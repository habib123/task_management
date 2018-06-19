class ApplicationController < ActionController::Base
   before_action :authenticate_user!
   devise_group :user, contains: [:expert, :novice]
   before_action :configure_permitted_parameters, if: :devise_controller?

   rescue_from CanCan::AccessDenied do |exception|
     redirect_to root_url, :alert => exception.message
   end

   private
   	def configure_permitted_parameters
 	    added_attrs = [:email, :password, :password_confirmation, :remember_me, :username, expert_detail_attributes:[:service, :profession], role_ids: []]
 	    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
 	    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
 	  end
end
