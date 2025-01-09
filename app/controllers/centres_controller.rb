class CentresController < ApplicationController
  before_action :set_centre, only: [ :edit, :update, :destroy ]

  def index
    @centres = Centre.all
  end

  def show
      @centre = Centre.find(params[:id])
      @donors = @centre.donors
      @donor_count = @donors.count
   
  end

  def new
    @centre = Centre.new
    @operator = current_user.operator
  end

  def create
    @centre = Centre.new(centre_params)
    if @centre.save
      redirect_to centres_path, notice: 'Centre created successfully.'
    else
      render :new
    end
  end

  def edit
        @centre = Centre.find(params[:id])
  end

  def update
    @centre = Centre.find(params[:id])
    if @centre.update(centre_params)
      redirect_to centres_path, notice: "Centre updated successfully!"
    else
      render :edit, alert: "Error updating Centre."
    end
  end

  def destroy
    if @centre.destroy
      redirect_to centres_path, notice: "Centre deleted successfully!"
    else
      redirect_to centres_path, alert: "Error deleting Centre."
    end
  end

  private

  def set_centre
    @centre = Centre.find(params[:id])
  end

  def centre_params
    params.require(:centre).permit(:name, :pincode, :location, :phone_number)
  end
end
