class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|

    	t.string :first_name
    	t.string :last_name
    	t.string :email, unique: true
      t.string :password_digest
      t.string :access_token, index: true, unique: true
    	t.string :bio
    	t.string :location


      t.timestamps
    end
  end
end
