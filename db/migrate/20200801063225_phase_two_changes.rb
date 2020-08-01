class PhaseTwoChanges < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :purchase_units, :string
    add_column :conversions, :purchase_units, :string
    add_column :conversions, :conversion_units, :string
    add_column :inventories, :selling_units, :string
  end
end
