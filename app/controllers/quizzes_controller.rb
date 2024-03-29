class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update, :destroy, :assign, :assignment]

  # GET /quizzes
  # GET /quizzes.json
  def index
    if current_user.admin?
      @quizzes = Quiz.all
    else
      @quizzes = Quiz.where(product_id: current_user.products.map(&:id)).all
    end
    
  end

  # GET /quizzes/1
  # GET /quizzes/1.json
  def show
  end

  # GET /quizzes/new
  def new
    @quiz = Quiz.new
  end

  # GET /quizzes/1/edit
  def edit
  end

  # POST /quizzes
  # POST /quizzes.json
  def create
    @quiz = Quiz.new(quiz_params)

    respond_to do |format|
      if @quiz.save
        format.html { redirect_to @quiz, notice: 'Quiz was successfully created.' }
        format.json { render :show, status: :created, location: @quiz }
      else
        format.html { render :new }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizzes/1
  # PATCH/PUT /quizzes/1.json
  def update
    respond_to do |format|
      if @quiz.update(quiz_params)
        format.html { redirect_to @quiz, notice: 'Quiz was successfully updated.' }
        format.json { render :show, status: :ok, location: @quiz }
      else
        format.html { render :edit }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzes/1
  # DELETE /quizzes/1.json
  def destroy
    @quiz.destroy
    respond_to do |format|
      format.html { redirect_to quizzes_url, notice: 'Quiz was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def assign

  end

  def assignment
    puts params.inspect    
    users = []
    users = users + Group.find(params[:group]).users unless params[:group].blank?    
    users = users + User.find(params[:users]) unless params[:users].blank?
    puts users.inspect
    users.each do |user|
      q = QuizAttempt.where(user_id: user.id, status_cd: 0, quiz_id: @quiz.id).first_or_create            
      q.total_questions = @quiz.answers.count      
      q.save!
    end
    redirect_to @quiz, notice: 'Quiz was successfully assigned.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_params
      params.require(:quiz).permit(:user_id, :product_id, :group_id, :title, answers_attributes: [:id, :question, :option_1, :option_2, :option_3, :option_4, :correct_answer, :_destroy])
    end
end
