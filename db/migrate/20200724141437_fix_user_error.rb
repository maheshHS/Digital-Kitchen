class FixUserError < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :user_id, :integer
    add_column :items, :user_id, :integer
    add_column :inventories, :user_id, :integer
  end
end
