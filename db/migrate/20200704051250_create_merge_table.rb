class CreateMergeTable < ActiveRecord::Migration[6.0]
  def change
    create_table :merge_tables do |t|
      t.integer :item_id
      t.integer :inventory_id
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
