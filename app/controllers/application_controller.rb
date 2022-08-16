class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    # before_action :authenticate_user! #devise
    before_action :update_allowed_parameters, if: :devise_controller?


    # rescue_from CanCan::AccessDenied do | exception |
    #     redirect_to root_url, alert: exception.message
    # end

    protected

    def update_allowed_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :phone, :email, :password)}
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :phone, :current_password)}
    end
end
