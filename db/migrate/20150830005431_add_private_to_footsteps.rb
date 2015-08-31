class AddPrivateToFootsteps < ActiveRecord::Migration
  def change
    add_column :footsteps, :private, :boolean, null: false, default: false
  end
end
