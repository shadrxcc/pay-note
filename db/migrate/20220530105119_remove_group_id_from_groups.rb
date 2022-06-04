class RemoveGroupIdFromGroups < ActiveRecord::Migration[7.0]
  def change
    remove_column :groups, :group_id, :integer
  end
end
