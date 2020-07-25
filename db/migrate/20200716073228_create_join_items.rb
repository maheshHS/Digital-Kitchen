class CreateJoinItems < ActiveRecord::Migration[6.0]
  def change
    create_table :join_items do |t|
      t.references :merge_tables
      t.timestamps
    end
  end
end
