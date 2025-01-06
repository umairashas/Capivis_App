class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  before_action :configure_permitted_parameters, if: :devise_controller?
  allow_browser versions: :modern
  def after_sign_in_path_for(resource)
    if resource.admin?
      root_path
    elsif resource.operator?
      root_path
    elsif resource.donor?
      if resource.donor.present?
        # If donor has filled out the form, redirect to the donors path
        root_path
      else
        # If donor hasn't filled out the form, redirect to the new donor registration path
        root_path
      end
    else
      root_path
    end
  end

 rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end

   protected

  # Permitting the extra fields during sign up, account update, and password reset
  def configure_permitted_parameters
    # Permit additional fields for sign_up
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :first_name, :last_name, :role, :aadhar_number ])

    # Permit additional fields for account update (if needed)
    devise_parameter_sanitizer.permit(:account_update, keys: [ :first_name, :last_name, :role, :aadhar_number ])
  end
end
