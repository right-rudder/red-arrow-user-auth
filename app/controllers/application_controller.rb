class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    layout :layout_by_resource
 
  protected
  
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password])
      devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password])
    # devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :middle_initial, :last_name, :birthday, :address_1, :address_2, :city, :state, :zip_code, :phone, :emergency_contact_name, :emergency_contact_number, :admin, :instructor, :student, :maintenance, :front_desk, :guest])
  
  end

  private

  def layout_by_resource
    if controller_name.in?(%w(weekly_calendar))
      'iframe_cal' # Use your specific layout for these controllers
    else
      'application' # Use the default layout for other controllers
    end
  end
end