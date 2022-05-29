class RemoveUserIdFromItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :user_id, :integer
    add_column :items, :item_id, :integer
  end
end
