class DonorsController < ApplicationController
  before_action :authenticate_user!

  def index
    @donors = Donor.all
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
      logger.debug "Redirecting to terms and conditions..."
      redirect_to new_donor_handbook_path, notice: 'Donor details were successfully created. Please review the terms and conditions.'
    else
      logger.debug "Errors: #{@donor.errors.full_messages}"
      render :new
    end
  end

  private
  def set_donor
    @donor=Donor.find(param[:id])
  end
  def donor_params
    params.require(:donor).permit(
      :first_name, :middle_name, :last_name, :birth_date, :gender, :zipcode,
      :phone_number, :alternate_phone_number, :city, :state, :country,
      :language, :address_line1, :address_line2, :document, :arrival_datetime,
      :potential_fraud
    )
  end
end
