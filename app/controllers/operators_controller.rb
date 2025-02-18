class OperatorsController < ApplicationController
  before_action :set_operator, only: [ :show ]

   def centre_and_donor_details
       @centre = Centre.find(params[:id])
       @donors = @centre.donors
       @donor_count = @donors.count
   end

   def index
    @centres = Centre.all 
    @operators = Operator.all
  end

  def show
      @operator = Operator.find(params[:id])
  end

  private

  def set_operator
    @operator = Operator.find(params[:id])
  end
end
