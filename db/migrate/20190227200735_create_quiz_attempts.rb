class CreateQuizAttempts < ActiveRecord::Migration[5.2]
  def change
    create_table :quiz_attempts do |t|
      t.references :quiz, foreign_key: true
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true
      t.integer :total_questions
      t.integer :correct_answer
      t.integer :status_cd

      t.timestamps
    end
  end
end
