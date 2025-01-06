class PagesController < ApplicationController
  # Remove authenticate_user! from the home action
  before_action :authenticate_user!, only: [ :edit, :update, :show ]
  def home
    # Home page is publicly accessible
  end

  def about
    # About page is publicly accessible
  end

  def contact
    # Contact page is publicly accessible
  end

  def show
    # Show user details if logged in
    @page = current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Automatically create a donor if the role is 'donor'
      @user.create_donor if @user.role == "Donor"
      redirect_to root_path, notice: "Signed up successfully!"
    else
      render :new
    end
  end

  def edit
    @page = current_user
  end

  def update
    @page = current_user
    if @page.update(user_params)
      redirect_to @page, notice: "Profile updated successfully."
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :role)
  end
end
