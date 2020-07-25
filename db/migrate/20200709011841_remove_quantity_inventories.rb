class RemoveQuantityInventories < ActiveRecord::Migration[6.0]
  def change
    remove_column :inventories, :quantity
    remove_column :inventories, :max_quant
  end
end
