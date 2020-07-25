class AddQuantityToPurchaseitem < ActiveRecord::Migration[6.0]
  def change
    add_column :purchaseitems, :quantity, :integer
    remove_column :purchases, :quantity
  end
end
