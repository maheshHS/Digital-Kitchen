class CreateInventory < ActiveRecord::Migration[6.0]
  def change
    create_table :inventories do |t|
      t.string :title
    end
  end
end
