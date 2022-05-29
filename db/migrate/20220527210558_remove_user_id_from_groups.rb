class RemoveUserIdFromGroups < ActiveRecord::Migration[7.0]
  def change
    remove_column :groups, :user_id, :integer
    add_column :groups, :group_id, :integer
  end
end
