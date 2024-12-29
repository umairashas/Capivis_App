class Users::RegistrationsController < Devise::RegistrationsController
  def destroy
    @current_user.destroy
  end
  
end