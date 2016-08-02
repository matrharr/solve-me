class CreateQuestionaires < ActiveRecord::Migration[5.0]
  def change
    create_table :questionaires do |t|

      t.integer :user_id
      t.string :first_question
      t.string :first_correct_answer
      t.string :first_middle_answer
      t.string :first_wrong_answer

      t.string :second_question
      t.string :second_correct_answer
      t.string :second_middle_answer
      t.string :second_wrong_answer

      t.string :third_question
      t.string :third_correct_answer
      t.string :third_middle_answer
      t.string :third_wrong_answer


      t.timestamps
    end
  end
end
