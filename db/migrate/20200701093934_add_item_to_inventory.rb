class AddItemToInventory < ActiveRecord::Migration[6.0]
  def change
    remove_column :inventories, :title
    add_column :inventories, :item_id, :integer 
    add_column :inventories, :quantity, :integer
    add_column :inventories, :max_quant, :integer
    add_timestamps(:inventories)  
  end
end
