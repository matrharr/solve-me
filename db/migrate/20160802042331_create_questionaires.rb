class CreateQuestionaires < ActiveRecord::Migration[5.0]
  def change
    create_table :questionaires do |t|

      t.integer :user_id


      t.timestamps
    end
  end
end
