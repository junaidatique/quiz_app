class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.references :group, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
