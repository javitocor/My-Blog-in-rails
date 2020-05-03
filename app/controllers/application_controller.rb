class ApplicationController < ActionController::Base
    before_action :configured_permitted_parameters, if: :devise_controller?
    
    protected
    def configured_permitted_parameters 
        devise_parameter_sanitizer.permit(:account_update, keys:[:avatar, :username, :email, :password, :password_confirmation,   :current_password])
    end
end
