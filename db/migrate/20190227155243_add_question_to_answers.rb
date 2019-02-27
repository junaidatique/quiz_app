class AddQuestionToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :question, :string
    rename_column :answers, :correct_anser, :correct_answer
  end
end
