class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|

      t.integer :questionaire_maker_id
      t.integer :questionaire_taker_id

      t.timestamps
    end
  end
end
