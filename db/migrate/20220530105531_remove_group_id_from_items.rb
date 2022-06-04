class RemoveGroupIdFromItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :group_id, :integer
  end
end
