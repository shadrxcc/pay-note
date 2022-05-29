class RemoveItemIdFromItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :item_id, :integer
    add_column :items, :group_id, :integer
  end
end
