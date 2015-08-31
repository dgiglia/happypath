class AddCompletedToFootsteps < ActiveRecord::Migration
  def change
    add_column :footsteps, :completed, :boolean, null: false, default: false
  end
end
