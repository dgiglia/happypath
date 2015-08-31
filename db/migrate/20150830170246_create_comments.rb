class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :user_id
      t.integer :footstep_id
      
      t.timestamps null: false
    end
  end
end
