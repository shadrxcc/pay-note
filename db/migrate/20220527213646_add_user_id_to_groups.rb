# frozen_string_literal: true

class AddUserIdToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :user_id, :integer
  end
end
