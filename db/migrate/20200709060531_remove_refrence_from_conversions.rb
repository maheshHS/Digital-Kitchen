class RemoveRefrenceFromConversions < ActiveRecord::Migration[6.0]
  def change
    #remove_references :conversions, :item
    add_column :conversions, :name, :string
  end
end
