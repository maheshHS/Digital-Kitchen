class DropConversions < ActiveRecord::Migration[6.0]
  def change
    drop_table :conversions
  end
end
