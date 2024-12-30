class DonorHistoryQuestionnairesController < ApplicationController
  before_action :authenticate_user!

  def new
    @donor_history_questionnaire = DonorHistoryQuestionnaire.new
    @questions = Question.all  # Fetch all questions
  end

  def create
    if params[:donor_history_questionnaire].present? && params[:donor_history_questionnaire][:answers].present?
    answers = params[:donor_history_questionnaire][:answers]
    answers.each do |question_id, answer|
      DonorHistoryQuestionnaire.create!(
        user_id: current_user.id, # Make sure you have `current_user` defined
        donor_id: current_user.donor.id,
        question_id: question_id,
        answer: answer
      )
    end
    redirect_to donors_path
    else
    flash[:alert] = "No answers provided. Please fill out the form."
    redirect_to new_donor_history_questionnaire_path
  end
rescue ActiveRecord::RecordInvalid => e
  flash[:alert] = "There was an error saving your answers: #{e.message}"
  redirect_to new_donor_history_questionnaire_path

  end

  # def create
  #  @question = Question.find(params[:question_id])
  # donor_id = params[:donor_history_questionnaire][:donor_id]
  # answers = params[:donor_history_questionnaire][:answers] # Expecting a hash of { question_id => answer }
  # if answers.present?
  #   answers.each do |question_id, answer|
  #     DonorHistoryQuestionnaire.create!(
  #       donor_id: donor_id,
  #       user_id: current_user.id,
  #       question_id: question_id,
  #       answer: answer
  #     )
  #   end
  #   flash[:notice] = "Responses successfully saved."
  #   redirect_to donors_path  # Redirect after successful creation
  # else
  #   flash.now[:alert] = "No answers provided. Please try again."
  #   @questions = Question.all
  #   render :new  # Re-render the form in case of validation errors
  # end
  # end

  private

  def donor_history_questionnaire_params
    params.require(:donor_history_questionnaire).permit(:donor_id, answers: {})
  end
end
