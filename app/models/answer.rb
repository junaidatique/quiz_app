class Answer < ApplicationRecord
  belongs_to :quiz
  validates_presence_of :question
  validates_presence_of :option_1
  validates_presence_of :option_2
  validates_presence_of :option_3
  validates_presence_of :option_4
  validates_presence_of :correct_answer
end
