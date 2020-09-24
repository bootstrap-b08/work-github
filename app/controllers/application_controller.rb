class ApplicationController < ActionController::Base

 before_action :configure_permitted_parameters, if: :devise_controller?

  # before_action :authenticate_customer!
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:is_deleted, :family_name, :first_name, :family_name_kana, :first_name_kana,
  	                                   :telephone_number, :email, :password, :postel_code, :address])
  end
end
