class CreateFootsteps < ActiveRecord::Migration
  def change
    create_table :footsteps do |t|
      t.string :title
      t.text :note
      
      t.string :slug
      t.timestamps null: false
    end
  end
end
