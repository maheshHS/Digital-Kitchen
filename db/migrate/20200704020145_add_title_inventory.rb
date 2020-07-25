class AddTitleInventory < ActiveRecord::Migration[6.0]
  def change
    add_column :inventories, :name, :string
  end
end
