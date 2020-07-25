class RenameItemQunatity < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :quantity, :t_qunatity
  end
end
