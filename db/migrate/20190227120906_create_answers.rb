class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :option_1
      t.string :option_2
      t.string :option_3
      t.string :option_4
      t.integer :correct_anser
      t.belongs_to :quiz, foreign_key: true

      t.timestamps
    end
  end
end
