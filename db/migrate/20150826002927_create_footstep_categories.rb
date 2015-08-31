class CreateFootstepCategories < ActiveRecord::Migration
  def change
    create_table :footstep_categories do |t|
      t.integer :footstep_id, :category_id 
      
      t.timestamps null: false
    end
  end
end
