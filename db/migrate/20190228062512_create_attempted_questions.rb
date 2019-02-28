class CreateAttemptedQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :attempted_questions do |t|
      t.string :question
      t.string :option_1
      t.string :option_2
      t.string :option_3
      t.string :option_4
      t.integer :correct_answer
      t.integer :submitted_answer
      t.belongs_to :quiz_attempt, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
