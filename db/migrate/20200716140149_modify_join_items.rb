class ModifyJoinItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :join_items, :merge_table_id
    add_column :join_items, :inventory_id, :integer
    add_column :join_items, :item_id, :integer
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
