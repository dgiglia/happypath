class AddUserIdToFootsteps < ActiveRecord::Migration
  def change
    add_column :footsteps, :user_id, :integer
  end
end
