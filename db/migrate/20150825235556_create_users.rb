class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.text :profile
      t.string :role
      t.string :time_zone
      
      t.string :slug
      t.timestamps null: false
    end
  end
end
