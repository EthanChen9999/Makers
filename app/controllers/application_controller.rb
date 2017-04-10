class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :set_local
  protect_from_forgery with: :exception

  protected
  # set current page after sign in
  def after_sign_in_path_for(resource)
    request.referer
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
    user_params.permit(:username, :email, :password, :password_confirmation, :profile, photo_attributes: [:id, :image])
    end
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:username, :email, :password, :password_confirmation)
    end
  end
  def set_local
    if cookies[:user_locale] && I18n.available_locales.include?(cookies[:user_locale].to_sym)
      l = cookies[:user_locale].to_sym
    else
      l = http_accept_language.compatible_language_from(I18n.available_locales)
      cookies.permanent[:user_locale] = l
    end
    I18n.locale = l || I18n.locale
  end
end
