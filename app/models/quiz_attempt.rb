class QuizAttempt < ApplicationRecord

  as_enum :status, assigned: 0, attempted: 1

  belongs_to :quiz
  belongs_to :user
  has_many :attempted_questions
  accepts_nested_attributes_for :attempted_questions, reject_if: :all_blank, allow_destroy: false

  def check_answers
    attempted_questions.each do |attempted_question|
      if attempted_question.submitted_answer == attempted_question.correct_answer
        attempted_question.score = 1
        attempted_question.save
      end
    end
    self.correct_answer = attempted_questions.where(score: 1).count
    self.status_cd = 1
    self.save
  end  
end
