class QuestionsController < ApplicationController
  before_action :authenticate_user!  # Assuming Devise for authentication
  load_and_authorize_resource  # This will load and authorize the Question resource

  # GET /questions
  def index
    @questions = Question.all
    @donors = Donor.all if current_user.admin?  # Fetch all questions, which are now global
  end

   def all_donors
    @donors = Donor.all
  end

  def show
  	@question = Question.find(params[:id])
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # POST /questions
  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to questions_path, notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  # GET /questions/:id/edit
  def edit
    # @question is automatically loaded and authorized by CanCanCan
  end

  # PATCH/PUT /questions/:id
  def update
    if @question.update(question_params)
      redirect_to questions_path, notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /questions/:id
  def destroy
    @question.destroy
    redirect_to questions_path, notice: 'Question was successfully destroyed.'
  end

  private

  def question_params
    params.require(:question).permit(:text, :answer_type)
  end
end
