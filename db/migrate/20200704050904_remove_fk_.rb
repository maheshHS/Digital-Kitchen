class RemoveFk < ActiveRecord::Migration[6.0]
  def change
    remove_column :inventories, :item_id
    remove_column :items, :inventory_id
  end
end
