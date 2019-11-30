# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
    layout 'devise'
    protect_from_forgery with: :exception
    before_action :authenticate_user!
  
  # DELETE /resource/sign_out
  def destroy
     session.clear
     redirect_to root_path
  end

  # GET /resource/sign_in
#   def new
#      super
#   end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  protected
  #ログイン後
  def after_sign_in_path_for(resource)
      work_places_path(resource)
  end
      
  
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

end
