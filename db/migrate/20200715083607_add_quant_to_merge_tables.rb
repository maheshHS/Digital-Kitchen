class AddQuantToMergeTables < ActiveRecord::Migration[6.0]
  def change
    add_column :merge_tables, :quantity, :integer
  end
end
