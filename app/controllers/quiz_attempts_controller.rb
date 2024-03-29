class QuizAttemptsController < ApplicationController
  before_action :set_quiz_attempt, only: [:show, :edit, :update, :destroy]

  # GET /quiz_attempts
  # GET /quiz_attempts.json
  def index
    if current_user.admin?
      @quiz_attempts = QuizAttempt.all
    else
      @quiz_attempts = QuizAttempt.where(user_id: current_user.id).all
    end
    
  end

  # GET /quiz_attempts/1
  # GET /quiz_attempts/1.json
  def show
    redirect_to quiz_attempts_path
  end

  # GET /quiz_attempts/new
  def new
    @quiz_attempt = QuizAttempt.new
  end

  # GET /quiz_attempts/1/edit
  def edit
    if @quiz_attempt.status_cd == 1
      redirect_to quiz_attempts_path
    end
    @quiz_attempt.attempted_questions.destroy_all
    @quiz_attempt.quiz.answers.each do |answer|
      attempted_question = @quiz_attempt.attempted_questions.new
      attempted_question.question = answer.question
      attempted_question.option_1 = answer.option_1
      attempted_question.option_2 = answer.option_2
      attempted_question.option_3 = answer.option_3
      attempted_question.option_4 = answer.option_4
      attempted_question.correct_answer = answer.correct_answer
      attempted_question.save
    end
  end

  # POST /quiz_attempts
  # POST /quiz_attempts.json
  def create
    @quiz_attempt = QuizAttempt.new(quiz_attempt_params)

    respond_to do |format|
      if @quiz_attempt.save
        format.html { redirect_to @quiz_attempt, notice: 'Quiz attempt was successfully created.' }
        format.json { render :show, status: :created, location: @quiz_attempt }
      else
        format.html { render :new }
        format.json { render json: @quiz_attempt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quiz_attempts/1
  # PATCH/PUT /quiz_attempts/1.json
  def update
    respond_to do |format|
      if @quiz_attempt.update(quiz_attempt_params)
        @quiz_attempt.check_answers
        format.html { redirect_to @quiz_attempt, notice: 'Quiz attempt was successfully updated.' }
        format.json { render :show, status: :ok, location: @quiz_attempt }
      else
        format.html { render :edit }
        format.json { render json: @quiz_attempt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quiz_attempts/1
  # DELETE /quiz_attempts/1.json
  def destroy
    @quiz_attempt.destroy
    respond_to do |format|
      format.html { redirect_to quiz_attempts_url, notice: 'Quiz attempt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz_attempt
      @quiz_attempt = QuizAttempt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_attempt_params
      params.require(:quiz_attempt).permit(attempted_questions_attributes: [:id, :submitted_answer])
    end
end
