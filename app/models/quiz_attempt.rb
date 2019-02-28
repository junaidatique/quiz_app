class QuizAttempt < ApplicationRecord

  as_enum :status, assigned: 0, attempted: 1

  belongs_to :quiz
  belongs_to :user
  # belongs_to :group
end
