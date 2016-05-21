class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :email, null: false, unique: true, index: true
  		t.string :password_digest, null: false

  		t.timestamps null: false
  	end
  	# add_index :users, :email, unique: true
  end
end
