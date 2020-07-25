class CreatePurchaseitems < ActiveRecord::Migration[6.0]
  def change
    create_table :purchaseitems do |t|
      t.integer :item_id
      t.integer :purchase_id
    end
  end
end
