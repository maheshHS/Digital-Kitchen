class AddCostToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :cost, :float
  end
end
