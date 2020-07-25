class CreateConversions < ActiveRecord::Migration[6.0]
  def change
    create_table :conversions do |t|
      t.references :item, index: true, foreign_key: true
      t.integer :quantity
      t.integer :converted_quantity
      t.timestamps
    end
  end
end
