    class DonorPhysicalExamsController < ApplicationController
      def index
        @donor_physical_exams = DonorPhysicalExam.all
        @centre = Centre.find(params[:centre_id]) if params[:centre_id]

      end

      def show
        @donor_physical_exam = DonorPhysicalExam.find(params[:id])
      end

      def new
         @donor_physical_exam = DonorPhysicalExam.new
          @donor_id= params[:donor_id],
          @centre_id= params[:centre_id],
          @donor_screening_id= params[:donor_screening_id]
      end
      
      def create

        @donor_physical_exam = DonorPhysicalExam.new(donor_physical_exam_params)
        
        if @donor_physical_exam.save
          redirect_to donor_physical_exams_path, notice: "Successfully completed the Physical Exam"
        else
          render :new, status: :unprocessable_entity
        end
      end

      def edit
       @donor_physical_exam = DonorPhysicalExam.new
      end

      def update
        @donor_physical_exam = DonorPhysicalExam.find(params[:id])
        if @donor_physical_exam.update(donor_physical_exam_params)
          redirect_to donor_physical_exams_path, notice: "Successfully updated the Physical Exam"
        else 
          render :edit, status: :unprocessable_entity
        end
      end

      def destroy
        @donor_physical_exam = DonorPhysicalExam.find(params[:id])
        @donor_physical_exam.destroy
        redirect_to donor_physical_exam_path, notice: "The exam was successfully deleted"
      end

      private

      private

      def donor_physical_exam_params
        params.require(:donor_physical_exam).permit(
                 :flipchart,
                 :donor_consents,
                 :high_risk_questionnaire_score,
                 :body_map,
                 :physical_exam,
                 :donor_id,
                 :centre_id,
                 :donor_screening_id
                 )
      end
    end
