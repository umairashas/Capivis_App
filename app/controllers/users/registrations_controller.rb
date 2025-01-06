class Users::RegistrationsController < Devise::RegistrationsController
  def destroy
    @current_user.destroy
  end

  def create
    super do |resource|
      if resource.persisted?
        # Send welcome email after user is created
        UserMailer.welcome_email(resource).deliver_now
      end
    end
  end
end
