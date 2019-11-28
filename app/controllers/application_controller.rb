class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
 
  private
      # deviseのストロングパラメーター
      def configure_permitted_parameters
        added_attrs = [:email, :password, :password_confirmation, :role]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
        devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
      end
      
      #ログアウト後
      def after_sign_out_path_for(resource)
        root_path
      end
          

      # def after_inactive_sign_up_path_for(resource)
      #   root_path
      # end

    # def user_params
    #     params.require(:user).permit(:email, :password, :role)
    # end
end
