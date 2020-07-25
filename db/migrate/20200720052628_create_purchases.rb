class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.string :seller
      t.integer :p_quantity
      t.float :cost
      t.integer :unit
    end
  end
end
