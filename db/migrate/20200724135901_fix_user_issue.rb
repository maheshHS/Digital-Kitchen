class FixUserIssue < ActiveRecord::Migration[6.0]
  def change
    remove_column :purchases, :user_id, :integer
  end
end
