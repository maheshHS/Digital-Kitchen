class AddCostToPurchaseitems < ActiveRecord::Migration[6.0]
  def change
    add_column :purchaseitems, :cost, :float
  end
end
