class CreateConversions2 < ActiveRecord::Migration[6.0]
  def change
    create_table :conversions do |t|
      t.string :name
      t.integer :quantity
      t.integer :converted_quant
      t.timestamps
    end
  end
end
