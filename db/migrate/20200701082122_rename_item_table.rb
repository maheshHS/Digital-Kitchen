class RenameItemTable < ActiveRecord::Migration[6.0]
  def change
    rename_table :item_tables, :items
  end
end
