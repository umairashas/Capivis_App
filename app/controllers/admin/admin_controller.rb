class Admin::AdminController < ApplicationController
  before_action :authenticate_user! # Ensure the user is logged in
  before_action :ensure_admin # Ensure the user is an admin
  
  def dashboard
    @section = params[:section]

    case params[:section]
    when 'donors'
      redirect_to donors_path
    when 'questions'
      redirect_to all_questions_path
    when 'donor_screenings'
      redirect_to donor_screenings_path
    else
      render 'admin/dashboard' 
    end
  end

  private

  def ensure_admin
    unless current_user.admin? # Assuming you have an `admin?` method in your `User` model
      redirect_to root_path, alert: 'Access denied. Only admins can access this page.'
    end
  end
end
