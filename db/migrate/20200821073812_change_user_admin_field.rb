class ChangeUserAdminField < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :isAdmin
    add_column :users, :isAdmin, :boolean
  end
end
