class CreateComments < ActiveRecord::Migration
  def change
  	create_table :comments do |t|
  		t.string :body, null: false
  		t.references :user
  		t.references :entry

  		t.timestamps null: false
  	end
  end
end