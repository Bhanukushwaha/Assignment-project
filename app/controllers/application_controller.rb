class ApplicationController < ActionController::Base
	 # before_action :authenticate_user!
	 before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :company_id, :monthly_charge , :start_date, :end_date, :passward,:role_id, :notes, :active])
  end

end
