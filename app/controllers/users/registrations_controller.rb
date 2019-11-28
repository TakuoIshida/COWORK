# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  protect_from_forgery with: :exception
  layout 'devise'
  before_action :session_delete
  # before_action :configure_permitted_parameters, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  
  # 登録後のセッションをクリアする
      def session_delete
          session.clear
      end
      
  #登録後
      def after_sign_up_path_for(resource)
        root_path
      end
      
  # GET new_user_registration_path ⇒ /users/sign_up
  # def new
  # end

  # POST /resource
  # def create
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  # end

  # The path used if gmail-error occuerd.
  # def after_inactive_sign_up_path_for(resource)
  #   render 'root'
  # end
end
