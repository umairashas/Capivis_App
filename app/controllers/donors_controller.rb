class DonorsController < ApplicationController
  before_action :authenticate_user!

  def index
    @donors = Donor.includes(:user).all
    @donors = Donor.all if current_user.admin?
    @questions = Question.all
    @donor = current_user.donor if current_user.donor.present?
  end

   def show
    @donor = Donor.find(params[:id])
    @questions = Question.all
    @donor_history_questionnaires = @donor.donor_history_questionnaires.includes(:question)

    # Fetch all questions for the donor history questionnaire
  end

  def new
    @donor = Donor.new
     @first_name = current_user.first_name
    @last_name = current_user.last_name
  end

  def create
  @donor = Donor.new(donor_params)
  @donor.user = current_user

  if @donor.save
    logger.debug "Donor saved successfully."

    # Check if the user is an admin or a donor
    if current_user.admin?
      logger.debug "Redirecting admin to donors list..."
      redirect_to admin_donors_path, notice: "Donor details were successfully created."
    else
      logger.debug "Redirecting donor to their dashboard..."
      redirect_to new_donor_handbook_path(donor_id: @donor.id), notice: "Donor details were successfully created. Please review the terms and conditions."
    end
  else
    logger.debug "Errors: #{@donor.errors.full_messages}"
    render :new
  end
  end

  def edit
    @donor=Donor.find(params[:id])
  end

  def update
        @donor=Donor.find(params[:id])
    if @donor.update(donor_params)
      redirect_to donor_path(@donor), notice: "Donor details were successfully updated."
    else
      render :edit
    end
  end

  def destroy
        @donor = Donor.find(params[:id])
    @donor.destroy
    redirect_to donors_path, notice: "Donor was successfully deleted."
  end

  private
  def set_donor
    @donor=Donor.find(param[:id])
  end
  def donor_params
    params.require(:donor).permit(
      :first_name, :middle_name, :last_name, :birth_date, :gender, :zipcode,
      :phone_number, :alternate_phone_number, :city, :state, :country,
      :language, :address_line1, :address_line2, :centre_id, :document, :arrival_datetime,
      :potential_fraud, :profile_image
    )
  end
end
