class DonorScreeningsController < ApplicationController
  def index
    @donor_screenings = DonorScreening.all
    @centre = Centre.find(params[:centre_id]) if params[:centre_id]
  end

  def new
    @donor_screening = DonorScreening.new
    @donor = Donor.find(params[:donor_id])
    @centre = Centre.find(params[:centre_id])
    @operator = Operator.find(params[:operator_id])
  end

  def show
     @donor_screening = DonorScreening.find_by(id: params[:id])
     if @donor_screening.nil?
    flash[:alert] = "Donor Screening not found."
    redirect_to donor_screenings_path
     end
  end

  def create
    @donor = Donor.find(params[:donor_screening][:donor_id])
    @centre = Centre.find(params[:donor_screening][:centre_id])
    @operator = Operator.find(params[:donor_screening][:operator_id])
    @donor_screening = DonorScreening.new(donor_screening_params)
     if @donor_screening.save
      UserMailer.screening_completed_email(@donor_screening.donor).deliver_now
      redirect_to donor_screenings_path, notice: "DonorScreening has been completed successfully"
     else
      render :new, status: :unprocessable_entity
     end
  end

  def edit
     @donor_screening = DonorScreening.find(params[:id])
     @donor = @donor_screening.donor # Fetch the donor from the donor_screening record
     @centre = @donor_screening.centre
  end

  def update
    @donor_screening = DonorScreening.find(params[:id])
    if @donor_screening.update(donor_screening_params)
      redirect_to donor_screenings_path, notice: "DonorScreening has been updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @donor_screening = DonorScreening.find(params[:id]) # Ensure the record is found
    @donor_screening.destroy
    redirect_to donor_screenings_path
  end

  private

  def donor_screening_params
    params.require(:donor_screening).permit(:acceptable_arm_check, :donor_height, :donor_weight, :donor_blood_pressure, :donor_temperature, :fingerstick, :hematocrit, :total_protein, :donor_id, :centre_id, :operator_id)
  end
end
