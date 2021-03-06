class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [ :email, :name, :password, :password_confirmation, :remember_me ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end

  #ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    prototypes_path
  end 
  #ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource)
    new_user_registration_path
  end 
end
