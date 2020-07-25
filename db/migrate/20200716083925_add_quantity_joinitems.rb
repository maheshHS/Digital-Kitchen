class AddQuantityJoinitems < ActiveRecord::Migration[6.0]
  def change
    add_column :join_items, :quantity, :integer 
  end
end
