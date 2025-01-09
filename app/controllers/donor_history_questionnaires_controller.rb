class DonorHistoryQuestionnairesController < ApplicationController
  before_action :authenticate_user!

  def new
    @donor_history_questionnaire = DonorHistoryQuestionnaire.new
    @questions = Question.all  # Fetch all questions
  end

  def create
  Rails.logger.debug("Incoming parameters: #{params.inspect}")
  @donor = Donor.find(params[:donor_id])
  
  if params[:donor_history_questionnaire].present? && params[:donor_history_questionnaire][:answers].present?
    answers = params[:donor_history_questionnaire][:answers]
    Rails.logger.debug("Extracted answers: #{answers.inspect}")
    
    answers.each do |question_id, answer|
      DonorHistoryQuestionnaire.create!(
        donor_id: @donor.id,
        question_id: question_id,
        answer: answer
      )
    end

    UserMailer.questionnaire_submission_confirmation(current_user).deliver_now
    redirect_to donors_path
  else
    Rails.logger.debug("Donor History Questionnaire or Answers missing.")
    flash[:alert] = "No answers provided. Please fill out the form."
    redirect_to new_donor_history_questionnaire_path(donor_id: params[:donor_id])
  end
 end

  private

  def donor_history_questionnaire_params
    params.require(:donor_history_questionnaire).permit(:donor_id, answers: {})
  end
end
