class AddQuantityToPurchaseitems < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :quantity, :integer
  end
end
