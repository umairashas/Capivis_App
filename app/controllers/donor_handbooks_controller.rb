  class DonorHandbooksController < ApplicationController
    before_action :set_donor_handbook, only: %i[ show edit update destroy ]

    # GET /donor_handbooks or /donor_handbooks.json
    def index
      @donor_handbooks = DonorHandbook.all
    end

    # GET /donor_handbooks/1 or /donor_handbooks/1.json
    def show
    end

    # GET /donor_handbooks/new
    def new
      @donor_handbook = DonorHandbook.new
    end

    # GET /donor_handbooks/1/edit
    def edit
    end

    # POST /donor_handbooks or /donor_handbooks.json
    def create
      @donor = Donor.find(params[:donor_handbook][:donor_id])
      @donor_handbook = DonorHandbook.new(donor_handbook_params)
      respond_to do |format|
        if @donor_handbook.save
          format.html do
            redirect_to new_donor_history_questionnaire_path(donor_id: @donor.id), notice: "Donor handbook was successfully created."
            return
          end
          format.json { render :show, status: :created, location: @donor_handbook }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @donor_handbook.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /donor_handbooks/1 or /donor_handbooks/1.json
    def update
      respond_to do |format|
        if @donor_handbook.update(donor_handbook_params)
          format.html { redirect_to @donor_handbook, notice: "Donor handbook was successfully updated." }
          format.json { render :show, status: :ok, location: @donor_handbook }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @donor_handbook.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /donor_handbooks/1 or /donor_handbooks/1.json
    def destroy
      @donor_handbook.destroy!

      respond_to do |format|
        format.html { redirect_to donor_handbooks_path, status: :see_other, notice: "Donor handbook was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_donor_handbook
        @donor_handbook = DonorHandbook.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def donor_handbook_params
        params.require(:donor_handbook).permit(:terms_accepted, :donor_id)
      end
  end

